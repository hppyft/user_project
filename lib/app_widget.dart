import 'package:flutter/material.dart';
import 'package:user_project/profile/profile_injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileInjection(),
    );
  }
}
