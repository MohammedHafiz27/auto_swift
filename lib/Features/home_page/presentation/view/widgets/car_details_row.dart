import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CarDetailsRow extends StatelessWidget {
  const CarDetailsRow({super.key, required this.title, this.icon});

  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blueAccent),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        Text(title, style: AppStyles.styleSemiBold18(context).copyWith(color: Colors.black)),
      ],
    );
  }
}
