import 'package:flutter/material.dart';

class SimpleTextWidget extends StatelessWidget {
  final String TextDiterima;
  final Color? textColor;
  final double? textSize;

  final Function()? onSimpleTap;

  const SimpleTextWidget({
    super.key,
    required this.TextDiterima,
    this.textColor,
    this.textSize,
    this.onSimpleTap,
    required String textditerima,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSimpleTap,
      child: Text(
        TextDiterima,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor ?? Colors.white, fontSize: textSize ?? 20.0),
      ),
    );
  }
}
