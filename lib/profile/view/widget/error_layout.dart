part of '../profile_page.dart';

class _ErrorLayout extends StatelessWidget {
  final String message;

  const _ErrorLayout({
    Key? key,
    required this.message,
  }) : super(key: key);

  void _reloadProfile(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).reloadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            color: UIColors.errorRed,
            size: 48,
          ),
          const VerticalSpacer(height: 24),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const VerticalSpacer(height: 24),
          ElevatedButton(
              onPressed: () => _reloadProfile(context),
              child: const Text('Recarregar'))
        ],
      ),
    );
  }
}
