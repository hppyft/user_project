import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_project/profile/bloc/profile_cubit.dart';
import 'package:user_project/profile/view/profile_page.dart';

class ProfileInjection extends StatelessWidget {
  const ProfileInjection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit()..loadProfile(),
      child: const ProfilePage(),
    );
  }
}
