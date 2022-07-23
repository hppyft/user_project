part of '../profile_page.dart';

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          _ProfileAvatar(),
          VerticalSpacer(height: 8),
          _ProfileName(),
          VerticalSpacer(height: 8),
          _ProfileEmail(),
        ],
      ),
    );
  }
}
