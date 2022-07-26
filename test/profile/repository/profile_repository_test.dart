import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:user_project/friends/repository/friends_endpoints.dart';
import 'package:user_project/friends/repository/friends_model.dart';
import 'package:user_project/friends/repository/friends_model_list.dart';
import 'package:user_project/friends/repository/friends_repository.dart';
import 'package:user_project/friends/repository/friends_repository_implementation.dart';
import 'package:user_project/profile/repository/profile_endpoints.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/profile/repository/profile_repository.dart';
import 'package:user_project/profile/repository/profile_repository_implementation.dart';
import 'package:user_project/shared/exception/default_rest_exception.dart';

class SpyClient extends Mock implements DioForNative {}

void main() {
  late DioForNative clientHttp;
  late ProfileRepository repository;

  Map<String, dynamic> profileResponse = {
    "results": [
      {
        "name": {"title": "Mr", "first": "Dino", "last": "Mendes"},
        "email": "dino.mendes@example.com",
        "picture": {
          "thumbnail": "https://randomuser.me/api/portraits/thumb/men/83.jpg"
        },
      }
    ],
  };

  setUp(() {
    clientHttp = SpyClient();
    repository = ProfileRepositoryImplementation(httpClient: clientHttp);
  });

  group('Tests [getRandomProfile]', () {
    test('Should throw exception if endpoint throws an exception', () async {
      when(() => clientHttp.get(any())).thenThrow(Exception());
      expectLater(repository.getRandomProfile(),
          throwsA(isA<DefaultRestException>()));
    });
    test('Should return a list if call succeeds', () async {
      Response defaultResponse = Response(
          statusCode: 200,
          data: profileResponse,
          requestOptions: RequestOptions(path: ProfileEndpoints.randomUser));
      when(() => clientHttp.get(any<String>())).thenAnswer((invocation) async => Future.value(defaultResponse));
      var actualProfile = await repository.getRandomProfile();
      var expectedProfile = ProfileModel.fromMap(profileResponse);
      expect(actualProfile, expectedProfile);
    });
  });
}
