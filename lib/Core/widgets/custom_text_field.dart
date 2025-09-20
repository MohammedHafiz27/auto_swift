import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({super.key, required this.hintText, this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hintText.toLowerCase() == "password" ? true : false,
      cursorColor: Theme.brightnessOf(context) == Brightness.dark ? Colors.white : Colors.black,
      style: AppStyles.styleSemiBold18(context),
      decoration: InputDecoration(
        hintText: hintText,
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.brightnessOf(context) == Brightness.dark ? Colors.white : Colors.black),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}
