import 'package:flutter/material.dart';

class DefaultDrawerItem {
  final String text;
  final IconData icon;
  final void Function(BuildContext) onPressed;

  DefaultDrawerItem({
    required this.text,
    required this.icon,
    required this.onPressed,
  });
}
