import 'package:dio/native_imp.dart';
import 'package:user_project/friends/repository/friends_model.dart';
import 'package:user_project/friends/repository/friends_endpoints.dart';
import 'package:user_project/friends/repository/friends_model_list.dart';
import 'package:user_project/friends/repository/friends_repository.dart';
import 'package:user_project/shared/exception/default_rest_exception.dart';

class FriendsRepositoryImplementation extends FriendsRepository {
  final DioForNative _httpClient;

  FriendsRepositoryImplementation({
    required DioForNative httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<List<FriendsModel>> getRandomFriends(int quantity) async {
    try{
      final response = await _httpClient.get(FriendsEndpoints.randomFriends,
          queryParameters: {'results': quantity});
      FriendsModelList friendsList = FriendsModelList.fromMap(response.data);
      return friendsList.friends;
    } catch (_){
      throw DefaultRestException();
    }
  }
}
