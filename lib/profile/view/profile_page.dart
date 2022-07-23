import 'package:flutter/material.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

part 'widget/profile_card.dart';

part 'widget/profile_avatar.dart';

part 'widget/profile_name.dart';

part 'widget/profile_email.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      backgroundColor: Colors.grey[200],
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: _ProfileCard(),
          ),
        ),
      ),
    );
  }
}
