import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_project/friends/bloc/friends_state.dart';
import 'package:user_project/friends/repository/friends_model.dart';
import 'package:user_project/friends/repository/friends_repository.dart';

class FriendsCubit extends Cubit<FriendsState> {
  final FriendsRepository _repository;
  final int friendsQuantity = 15;

  FriendsCubit({required FriendsRepository repository})
      : _repository = repository,
        super(const LoadingFriends());

  Future<void> reloadFriends() async {
    emit(const LoadingFriends());
    await loadFriends();
  }

  Future<void> loadFriends() async {
    try {
      bool internetConnection = await hasInternet();
      if (!internetConnection) {
        emit(const ErrorLoadingFriends(
            message:
                'Parece que você não está conectado a internet, por favor conecte-se e tente novamente.'));
      } else {
        List<FriendsModel> modelList =
            await _repository.getRandomFriends(friendsQuantity);
        emit(FriendsLoaded(modelList: modelList));
      }
    } catch (_) {
      emit(const ErrorLoadingFriends(
          message:
              'Ocorreu um erro inesperado ao carregar a lista de amigos, por favor tente novamente.'));
    }
  }

  Future<bool> hasInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
