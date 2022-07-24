part of '../friends_page.dart';

class _FriendsList extends StatelessWidget {
  final List<FriendModel> friends;

  const _FriendsList({
    Key? key,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: friends.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (_, __) => const VerticalSpacer(height: 8),
      itemBuilder: (_, index) {
        FriendModel friend = friends[index];
        return DefaultCard(
          child: Row(
            children: [
              AvatarImage(avatarUrl: friend.avatarUrl),
              const HorizontalSpacer(width: 16),
              Text(
                friend.name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
