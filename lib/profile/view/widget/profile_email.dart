part of '../profile_page.dart';

class _ProfileEmail extends StatelessWidget {
  final String email;

  const _ProfileEmail({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: const TextStyle(
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }
}
