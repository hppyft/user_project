import 'package:user_project/friends/repository/friends_model.dart';

abstract class FriendsRepository {
  Future<List<FriendsModel>> getRandomFriends(int quantity);
}