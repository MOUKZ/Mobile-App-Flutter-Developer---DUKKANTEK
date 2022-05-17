import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final TextStyle? textStyle;

  const CustomTextWidget({
    Key? key,
    required this.title,
    this.fontSize,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: textStyle ??
          TextStyle(
              fontSize: fontSize ?? 32,
              color: Colors.white,
              fontWeight: FontWeight.bold),
      maxLines: 1,
    );
  }
}
