import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_project/friends/friends_injection.dart';
import 'package:user_project/profile/bloc/profile_cubit.dart';
import 'package:user_project/profile/bloc/profile_state.dart';
import 'package:user_project/profile/repository/profile_model.dart';
import 'package:user_project/shared/const/ui_colors.dart';
import 'package:user_project/shared/widget/avatar_image.dart';
import 'package:user_project/shared/widget/default_card.dart';
import 'package:user_project/shared/widget/default_drawer/default_drawer.dart';
import 'package:user_project/shared/widget/default_drawer/default_drawer_item.dart';
import 'package:user_project/shared/widget/default_error_card.dart';
import 'package:user_project/shared/widget/horizontal_spacer.dart';
import 'package:user_project/shared/widget/shimmer_item.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

part 'widget/profile_card.dart';

part 'widget/profile_avatar.dart';

part 'widget/profile_name.dart';

part 'widget/profile_email.dart';

part 'widget/profile_error_layout.dart';

part 'widget/profile_loading_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        elevation: 24,
        shape: const RoundedRectangleBorder(),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileCubit>().loadProfile();
    });
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
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ErrorLoadingProfile) {
                  _showErrorDialog(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  return _ProfileCard(profileModel: state.profile);
                } else if (state is ErrorLoadingProfile) {
                  return _ProfileErrorLayout(message: state.message);
                } else {
                  return const _ProfileLoadingLayout();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
