import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_project/friends/bloc/friends_cubit.dart';
import 'package:user_project/friends/bloc/friends_state.dart';
import 'package:user_project/friends/repository/friends_model.dart';
import 'package:user_project/shared/const/ui_colors.dart';
import 'package:user_project/shared/widget/avatar_image.dart';
import 'package:user_project/shared/widget/default_card.dart';
import 'package:user_project/shared/widget/default_error_card.dart';
import 'package:user_project/shared/widget/horizontal_spacer.dart';
import 'package:user_project/shared/widget/shimmer_item.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

part 'widget/friends_list.dart';

part 'widget/friends_error_layout.dart';

part 'widget/friends_loading_layout.dart';

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
          child: BlocBuilder<FriendsCubit, FriendsState>(
            builder: (context, state) {
              if (state is FriendsLoaded) {
                return _FriendsList(friends: state.modelList);
              } else if (state is ErrorLoadingFriends) {
                return _FriendsErrorLayout(message: state.message);
              } else {
                return const _FriendsLoadingLayout();
              }
            },
          ),
        ),
      ),
    );
  }
}
