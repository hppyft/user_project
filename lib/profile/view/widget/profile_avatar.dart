part of '../profile_page.dart';

class _ProfileAvatar extends StatelessWidget {
  final String avatarUrl;

  const _ProfileAvatar({
    Key? key,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarImage(avatarUrl: avatarUrl);
  }
}
