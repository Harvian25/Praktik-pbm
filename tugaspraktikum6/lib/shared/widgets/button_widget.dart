import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? textButton;
  final Color? colorButton;
  final Color? colorTextButton;
  final bool? isBtnDisabled;

  final Function()? onPressed;

  const ButtonWidget({
    super.key,
    this.textButton,
    this.colorButton,
    this.onPressed,
    this.colorTextButton,
    this.isBtnDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            isBtnDisabled! ? Colors.grey : colorButton ?? Colors.black),
      ),
      onPressed: onPressed,
      child: Text(
        textButton ?? "klik disini",
        style: TextStyle(color: colorTextButton ?? Colors.white),
      ),
    );
  }
}
