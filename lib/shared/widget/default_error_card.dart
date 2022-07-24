import 'package:flutter/material.dart';
import 'package:user_project/shared/const/ui_colors.dart';
import 'package:user_project/shared/widget/default_card.dart';
import 'package:user_project/shared/widget/vertical_spacer.dart';

class DefaultErrorCard extends StatelessWidget {
  final String message;
  final void Function(BuildContext) reload;

  const DefaultErrorCard({
    Key? key,
    required this.message,
    required this.reload,
  }) : super(key: key);

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
              onPressed: () => reload(context),
              child: const Text('Recarregar'))
        ],
      ),
    );
  }
}
