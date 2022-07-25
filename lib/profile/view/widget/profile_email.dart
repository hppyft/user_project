part of '../profile_page.dart';

class _ProfileEmail extends StatelessWidget {
  final String email;

  const _ProfileEmail({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.email),
        const HorizontalSpacer(width: 8),
        Text(
          email,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
