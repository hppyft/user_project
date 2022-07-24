import 'package:user_project/friends/repository/friends_model.dart';

abstract class FriendsState {
  const FriendsState();
}

class LoadingFriends extends FriendsState {
  const LoadingFriends();
}

class FriendsLoaded extends FriendsState {
  final List<FriendsModel> modelList;

  const FriendsLoaded({required this.modelList});
}

class ErrorLoadingFriends extends FriendsState {
  final String message;

  const ErrorLoadingFriends({required this.message});
}
