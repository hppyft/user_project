import 'package:user_project/profile/repository/profile_model.dart';

abstract class ProfileState {
  const ProfileState();
}

class LoadingProfile extends ProfileState {
  const LoadingProfile();
}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;

  const ProfileLoaded({required this.profile});
}

class ErrorLoadingProfile extends ProfileState {
  final String message;

  const ErrorLoadingProfile({required this.message});
}
