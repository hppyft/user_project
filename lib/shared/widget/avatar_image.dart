import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String avatarUrl;

  const AvatarImage({
    Key? key,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: Image.network(
        avatarUrl,
      ),
    );
  }
}
