import 'package:auto_swift/Features/admin_page/presentation/views/widgets/car_form.dart';
import 'package:flutter/material.dart';

class AdminPageMobileLayout extends StatelessWidget {
  const AdminPageMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(backgroundColor: Colors.red, radius: 18),
              Icon(Icons.upload_file_rounded),
            ],
          ),
          CarForm(),
        ],
      ),
    );
  }
}
