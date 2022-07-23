import 'package:flutter/material.dart';
import 'package:user_project/shared/const/ui_colors.dart';

class ShimmerItem extends StatelessWidget {
  final double? widthFactor;
  final double? heightFactor;
  final double? width;
  final double? height;

  const ShimmerItem({
    Key? key,
    this.width,
    this.height,
    this.widthFactor,
    this.heightFactor,
  })  : assert(widthFactor != null ? width == null : width != null,
            'Must set only one between width or widthFactor'),
        assert(heightFactor != null ? height == null : height != null,
            'Must set only one between height or heightFactor'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: Container(
        decoration: const BoxDecoration(
          color: UIColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
