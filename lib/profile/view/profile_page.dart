import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_project/friends/friends_injection.dart';
import 'package:user_project/profile/bloc/profile_cubit.dart';
import 'package:user_project/profile/bloc/profile_state.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/shared/const/ui_colors.dart';
import 'package:user_project/shared/widget/default_card.dart';
import 'package:user_project/shared/widget/default_drawer/default_drawer.dart';
import 'package:user_project/shared/widget/default_drawer/default_drawer_item.dart';
import 'package:user_project/shared/widget/shimmer_item.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

part 'widget/profile_card.dart';

part 'widget/profile_avatar.dart';

part 'widget/profile_name.dart';

part 'widget/profile_email.dart';

part 'widget/error_layout.dart';

part 'widget/loading_profile_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      backgroundColor: UIColors.backgroundGrey,
      drawer: DefaultDrawer(
        items: [
          DefaultDrawerItem(
            text: 'Lista de Amigos',
            icon: Icons.people,
            onPressed: (context) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FriendsInjection()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  return _ProfileCard(profileModel: state.profile);
                } else if (state is ErrorLoadingProfile) {
                  return _ErrorLayout(message: state.message);
                } else {
                  return const _LoadingProfileLayout();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
