import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_project/profile/profile_injection.dart';
import 'package:user_project/shared/client/base_dio.dart';

class AppInjector extends StatelessWidget {
  const AppInjector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BaseDio>(
      create: (context) => BaseDio(),
      child: MaterialApp(
        title: 'Desafio Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProfileInjection(),
      ),
    );
  }
}
