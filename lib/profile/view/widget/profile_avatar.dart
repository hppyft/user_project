part of '../profile_page.dart';

class _ProfileAvatar extends StatelessWidget {
  final String avatarUrl;

  const _ProfileAvatar({
    Key? key,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999.0),
      child: Image.network(
        avatarUrl,
      ),
    );
  }
}
