import 'package:bloc/bloc.dart';
import 'package:user_project/profile/bloc/profile_state.dart';
import 'package:user_project/profile/repository/profile_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const LoadingProfile());

  Future<void> loadProfile() async {
    await Future.delayed(Duration(seconds: 2));
    // try {
    //   final ProfileModel profile = ProfileModel(
    //       name: 'Leonardo Soares',
    //       email: 'leohppyftsoares@gmail.com',
    //       avatarUrl: 'https://randomuser.me/api/portraits/thumb/women/60.jpg');
    //   emit(ProfileLoaded(profile: profile));
    // } catch (e) {
    emit(const ErrorLoadingProfile(
        message:
            'Ocorreu um erro ao tentar resgatar o perfil, por favor tente novamente.'));
    // }
  }

  Future<void> reloadProfile() async {
    emit(const LoadingProfile());
    await loadProfile();
  }
}
