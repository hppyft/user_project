part of '../profile_page.dart';

class _ProfileName extends StatelessWidget {
  final String name;

  const _ProfileName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.person),
        const HorizontalSpacer(width: 8),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
