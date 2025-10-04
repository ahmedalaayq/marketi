import 'package:flutter/material.dart';

class CustomCartAppbar extends StatelessWidget {
  const CustomCartAppbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(title:  Text(title));
  }
}
