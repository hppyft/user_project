import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:user_project/profile/bloc/profile_state.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/profile/repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;
  final Connectivity _connectivity;

  ProfileCubit({
    required ProfileRepository profileRepository,
    required Connectivity connectivity,
  })  : _repository = profileRepository,
        _connectivity = connectivity,
        super(const LoadingProfile());

  Future<void> reloadProfile() async {
    emit(const LoadingProfile());
    await loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      bool internetConnection = await _hasInternet();
      if (!internetConnection) {
        emit(const ErrorLoadingProfile(
            message:
                'Parece que você não está conectado a internet, por favor conecte-se e tente novamente.'));
      } else {
        final ProfileModel profile = await _repository.getRandomProfile();
        emit(ProfileLoaded(profile: profile));
      }
    } catch (_) {
      emit(const ErrorLoadingProfile(
          message:
              'Ocorreu um erro ao tentar resgatar o perfil, por favor tente novamente.'));
    }
  }

  Future<bool> _hasInternet() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
