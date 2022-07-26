import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_project/profile/bloc/profile_cubit.dart';
import 'package:user_project/profile/repository/profile_repository_implementation.dart';
import 'package:user_project/profile/view/profile_page.dart';
import 'package:user_project/shared/client/base_dio.dart';

class ProfileInjection extends StatelessWidget {
  const ProfileInjection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(
        profileRepository: ProfileRepositoryImplementation(
          httpClient: context.read<BaseDio>(),
        ),
        connectivity: Connectivity(),
      ),
      child: const ProfilePage(),
    );
  }
}
