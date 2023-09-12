import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.label, this.fontSize, this.color, this.fontWeight,
  });

  final String label;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize ?? 23,
          fontWeight: fontWeight ?? FontWeight.w600),
      softWrap: true,

    );
  }
}