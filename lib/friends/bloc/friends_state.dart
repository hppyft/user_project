import 'package:user_project/friends/repository/friend_model.dart';

abstract class FriendsState {
  const FriendsState();
}

class LoadingFriends extends FriendsState {
  const LoadingFriends();
}

class FriendsLoaded extends FriendsState {
  final List<FriendModel> modelList;

  const FriendsLoaded({required this.modelList});
}

class ErrorLoadingFriends extends FriendsState {
  final String message;

  const ErrorLoadingFriends({required this.message});
}
