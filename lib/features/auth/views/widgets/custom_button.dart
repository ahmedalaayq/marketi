import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    this.backgroundColor, this.btnTextStyle,
  });
  final String btnText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? btnTextStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor,textStyle: btnTextStyle),
      onPressed: onPressed,
      child: Text(btnText),
    );
  }
}
