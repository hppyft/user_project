import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_project/friends/bloc/friends_state.dart';
import 'package:user_project/friends/repository/friend_model.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit() : super(const LoadingFriends());

  Future<void> reloadFriends() async {
    emit(const LoadingFriends());
    await loadFriends();
  }

  Future<void> loadFriends() async {
    await Future.delayed(Duration(seconds: 2));
    List<FriendModel> modelList = List.filled(
      15,
      FriendModel(
          avatarUrl: 'https://randomuser.me/api/portraits/thumb/women/60.jpg',
          name: 'Leonardo Soares'),
    );
    emit(FriendsLoaded(modelList: modelList));
  }
}
