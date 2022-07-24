part of '../friends_page.dart';

class _FriendsErrorLayout extends StatelessWidget {
  final String message;

  const _FriendsErrorLayout({
    Key? key,
    required this.message,
  }) : super(key: key);

  void _reloadFriends(BuildContext context) {
    BlocProvider.of<FriendsCubit>(context).reloadFriends();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultErrorCard(message: message, reload: _reloadFriends);
  }
}
