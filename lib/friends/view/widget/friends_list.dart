part of '../friends_page.dart';

class _FriendsList extends StatelessWidget {
  final List<FriendsModel> friends;

  const _FriendsList({
    Key? key,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: UIColors.black,
              fontSize: 18,
            ),
            children: <TextSpan>[
              const TextSpan(text: 'Você possui '),
              TextSpan(
                text: '${friends.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: UIColors.drawerBlue,
                ),
              ),
              const TextSpan(text: ' amigos!'),
            ],
          ),
        ),
        const VerticalSpacer(height: 8),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: friends.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const VerticalSpacer(height: 8),
            itemBuilder: (_, index) {
              FriendsModel friend = friends[index];
              return _FriendsListItem(friend: friend);
            },
          ),
        ),
      ],
    );
  }
}
