import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDrobDownButton extends StatelessWidget {
  const CustomDrobDownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.hint,
    required this.valid,
  });
  final String? value;
  final String? valid;
  final String? hint;
  final List<DropdownMenuItem<String>>? items;
  final void Function(dynamic v)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      iconStyleData: IconStyleData(icon: Icon(Icons.keyboard_arrow_right_rounded)),
      decoration: InputDecoration(
        filled: true,
        focusColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
        fillColor: Theme.brightnessOf(context) == Brightness.dark ? Colors.black : Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      value: value,
      hint: Text(hint ?? 'Select'),
      validator: (value) => value == null ? 'Please select an option.' : null,
      items: items,
      onChanged: onChanged,
    );
  }
}
