import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_project/friends/bloc/friends_cubit.dart';
import 'package:user_project/friends/repository/friends_repository_implementation.dart';
import 'package:user_project/friends/view/friends_page.dart';
import 'package:user_project/shared/client/base_dio.dart';

class FriendsInjection extends StatelessWidget {
  const FriendsInjection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FriendsCubit>(
      create: (context) => FriendsCubit(
        repository: FriendsRepositoryImplementation(
          httpClient: context.read<BaseDio>(),
        ),
        connectivity: Connectivity(),
      ),
      child: const FriendsPage(),
    );
  }
}
