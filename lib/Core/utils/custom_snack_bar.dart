import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.message, required this.backgroundColor});
  final String message;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(message), backgroundColor: backgroundColor, duration: Duration(seconds: 2));
  }
}
