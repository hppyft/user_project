import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  final double width;

  const HorizontalSpacer({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
