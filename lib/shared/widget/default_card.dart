import 'package:flutter/material.dart';
import 'package:user_project/shared/const/ui_colors.dart';

class DefaultCard extends StatelessWidget {
  final Widget child;

  const DefaultCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
