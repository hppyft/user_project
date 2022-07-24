part of '../profile_page.dart';

class _ProfileErrorLayout extends StatelessWidget {
  final String message;

  const _ProfileErrorLayout({
    Key? key,
    required this.message,
  }) : super(key: key);

  void _reloadProfile(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).reloadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultErrorCard(
      message: message,
      reload: _reloadProfile,
    );
  }
}
