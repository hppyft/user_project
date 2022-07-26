import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:user_project/friends/repository/friends_endpoints.dart';
import 'package:user_project/friends/repository/friends_model_list.dart';
import 'package:user_project/friends/repository/friends_repository.dart';
import 'package:user_project/friends/repository/friends_repository_implementation.dart';
import 'package:user_project/shared/exception/default_rest_exception.dart';

class SpyClient extends Mock implements DioForNative {}

void main() {
  late DioForNative clientHttp;
  late FriendsRepository repository;

  Map<String, dynamic> friendsResponse = {
    "results": [
      {
        "name": {"first": "Eloy", "last": "Fernández"},
        "picture": {
          "thumbnail": "https://randomuser.me/api/portraits/thumb/men/48.jpg"
        },
      },
      {
        "name": {"first": "Patrik", "last": "Kim"},
        "picture": {
          "thumbnail": "https://randomuser.me/api/portraits/thumb/men/41.jpg"
        },
      }
    ],
  };

  setUp(() {
    clientHttp = SpyClient();
    repository = FriendsRepositoryImplementation(httpClient: clientHttp);
  });

  group('Tests [getRandomFriends]', () {
    test('Should throw exception if endpoint throws an exception', () async {
      when(() => clientHttp.get(any())).thenThrow(Exception());
      expectLater(repository.getRandomFriends(10),
          throwsA(isA<DefaultRestException>()));
    });
    test('Should return a list if call succeeds', () async {
      Response defaultResponse = Response(
          statusCode: 200,
          data: friendsResponse,
          requestOptions: RequestOptions(path: FriendsEndpoints.randomFriends));
      when(() => clientHttp.get(any<String>(), queryParameters: any(named: 'queryParameters'))).thenAnswer((invocation) async => Future.value(defaultResponse));
      var actualList = await repository.getRandomFriends(2);
      var expectedList = FriendsModelList.fromMap(friendsResponse);
      expect(actualList, expectedList.friends);
    });
  });
}
