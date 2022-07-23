import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:user_project/profile/bloc/profile_state.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/profile/repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;

  ProfileCubit({required ProfileRepository profileRepository})
      : _repository = profileRepository,
        super(const LoadingProfile());

  Future<void> reloadProfile() async {
    emit(const LoadingProfile());
    await loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      bool internetConnection = await hasInternet();
      if (!internetConnection) {
        emit(const ErrorLoadingProfile(
            message:
                'Parece que você não está conectado a internet, por favor conecte-se e tente novamente.'));
      } else {
        final ProfileModel profile = await _repository.getRandomProfile();
        emit(ProfileLoaded(profile: profile));
      }
    } catch (e) {
      emit(const ErrorLoadingProfile(
          message:
              'Ocorreu um erro ao tentar resgatar o perfil, por favor tente novamente.'));
    }
  }

  Future<bool> hasInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
