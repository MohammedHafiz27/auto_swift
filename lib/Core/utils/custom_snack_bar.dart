import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar build({required String message, required Color backgroundColor}) {
    return SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
  }
}
