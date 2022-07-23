import 'package:user_project/profile/repository/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getRandomProfile();
}