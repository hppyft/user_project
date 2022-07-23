part of '../profile_page.dart';

class _ProfileCard extends StatelessWidget {
  final ProfileModel profileModel;

  const _ProfileCard({
    Key? key,
    required this.profileModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _ProfileAvatar(avatarUrl: profileModel.avatarUrl),
          const VerticalSpacer(height: 8),
          _ProfileName(name: profileModel.name),
          const VerticalSpacer(height: 8),
          _ProfileEmail(email: profileModel.email),
        ],
      ),
    );
  }
}
