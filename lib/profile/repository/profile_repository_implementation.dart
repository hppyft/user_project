import 'package:dio/native_imp.dart';
import 'package:user_project/profile/repository/profile_endpoints.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/profile/repository/profile_repository.dart';
import 'package:user_project/shared/exception/default_rest_exception.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final DioForNative _httpClient;


  ProfileRepositoryImplementation({required DioForNative httpClient,})
      : _httpClient = httpClient;

  @override
  Future<ProfileModel> getRandomProfile() async {
    try {
      var response = await _httpClient.get(ProfileEndpoints.randomUser);
      ProfileModel profile = ProfileModel.fromMap(response.data);
      return profile;
    } catch (_) {
      throw DefaultRestException();
    }
  }

}