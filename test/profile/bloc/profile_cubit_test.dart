import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_project/friends/bloc/friends_cubit.dart';
import 'package:user_project/friends/bloc/friends_state.dart';
import 'package:user_project/friends/repository/friends_model.dart';
import 'package:user_project/friends/repository/friends_repository.dart';
import 'package:user_project/profile/bloc/profile_cubit.dart';
import 'package:user_project/profile/bloc/profile_state.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/profile/repository/profile_repository.dart';

class FakeProfileRepository extends Mock implements ProfileRepository {}

class FakeConnectivity extends Mock implements Connectivity {}

void main() {
  late ProfileCubit bloc;
  late FakeProfileRepository fakeRepository;
  late FakeConnectivity fakeConnectivity;

  setUp(() {
    fakeRepository = FakeProfileRepository();
    fakeConnectivity = FakeConnectivity();
    bloc = ProfileCubit(
      profileRepository: fakeRepository,
      connectivity: fakeConnectivity,
    );
  });

  group('Check [_hasInternet]', () {
    test('Should emit error when has no connectivity', () {
      expectLater(
        bloc.stream,
        emitsInOrder(
          [
            isA<ErrorLoadingProfile>().having(
              (p0) => p0.message,
              'Error message',
              'Parece que você não está conectado a internet, por favor conecte-se e tente novamente.',
            ),
          ],
        ),
      );
      when(() => fakeConnectivity.checkConnectivity())
          .thenAnswer((invocation) => Future.value(ConnectivityResult.none));
      bloc.loadProfile();
    });
    test('Should emit error when [_connectivity] throws exception', () {
      expectLater(
        bloc.stream,
        emitsInOrder(
          [
            isA<ErrorLoadingProfile>().having(
              (p0) => p0.message,
              'Error message',
              'Ocorreu um erro ao tentar resgatar o perfil, por favor tente novamente.',
            ),
          ],
        ),
      );
      when(() => fakeConnectivity.checkConnectivity()).thenThrow(Exception());
      bloc.loadProfile();
    });
  });

  group('Check [reloadProfile]', () {
    test('Should emit [LoadingProfile]', () {
      ProfileModel profileModel = ProfileModel(name: 'abc', email: 'a@a.com', avatarUrl: 'url');
      expectLater(
        bloc.stream,
        emits(
          isA<LoadingProfile>(),
        ),
      );
      when(() => fakeConnectivity.checkConnectivity()).thenAnswer(
          (invocation) => Future.value(ConnectivityResult.ethernet));
      when(() => fakeRepository.getRandomProfile())
          .thenAnswer((invocation) => Future.value(profileModel));
      bloc.reloadProfile();
    });
  });

  group('Check [loadFriends]', () {
    test('Should emit error when has [_repository] throws an exception', () {
      expectLater(
        bloc.stream,
        emitsInOrder(
          [
            isA<ErrorLoadingProfile>().having(
              (p0) => p0.message,
              'Error message',
              'Ocorreu um erro ao tentar resgatar o perfil, por favor tente novamente.',
            ),
          ],
        ),
      );
      when(() => fakeConnectivity.checkConnectivity()).thenAnswer(
          (invocation) => Future.value(ConnectivityResult.ethernet));
      when(() => fakeRepository.getRandomProfile()).thenThrow(Exception());
      bloc.loadProfile();
    });
    test('Should emit [FriendsLoaded] when it all goes well', () {
      ProfileModel profileModel = ProfileModel(name: 'abc', email: 'a@a.com', avatarUrl: 'url');
      expectLater(
        bloc.stream,
        emitsInOrder(
          [
            isA<ProfileLoaded>()
                .having((p0) => p0.profile, 'Profile', profileModel),
          ],
        ),
      );
      when(() => fakeConnectivity.checkConnectivity()).thenAnswer(
          (invocation) => Future.value(ConnectivityResult.ethernet));
      when(() => fakeRepository.getRandomProfile())
          .thenAnswer((invocation) => Future.value(profileModel));
      bloc.loadProfile();
    });
  });
}
