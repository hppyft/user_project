part of '../profile_page.dart';

class _ProfileName extends StatelessWidget {
  const _ProfileName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Leonardo Soares',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }
}
