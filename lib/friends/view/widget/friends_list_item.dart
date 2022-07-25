part of '../friends_page.dart';

class _FriendsListItem extends StatelessWidget {
  final FriendsModel friend;

  const _FriendsListItem({
    Key? key,
    required this.friend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Row(
        children: [
          AvatarImage(avatarUrl: friend.avatarUrl),
          const HorizontalSpacer(width: 16),
          const Icon(Icons.person),
          const HorizontalSpacer(width: 8),
          Text(
            friend.name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
