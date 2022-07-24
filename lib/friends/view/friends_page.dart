import 'package:flutter/material.dart';
import 'package:user_project/shared/const/ui_colors.dart';
import 'package:user_project/shared/widget/avatar_image.dart';
import 'package:user_project/shared/widget/default_card.dart';
import 'package:user_project/shared/widget/horizontal_spacer.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Amigos'),
      ),
      backgroundColor: UIColors.backgroundGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView.separated(
            itemCount: 15,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const VerticalSpacer(height: 8),
            itemBuilder: (_, index) {
              return DefaultCard(
                child: Row(
                  children: const [
                    AvatarImage(
                        avatarUrl:
                            'https://randomuser.me/api/portraits/thumb/women/60.jpg'),
                    HorizontalSpacer(width: 16),
                    Text(
                      'Leonardo Soares',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
