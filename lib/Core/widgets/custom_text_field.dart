import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({super.key, required this.hintText, this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(placeholder: hintText, controller: controller, keyboardType: keyboardType);
  }
}
