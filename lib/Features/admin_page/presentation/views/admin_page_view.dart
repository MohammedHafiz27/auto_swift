import 'package:auto_swift/Features/admin_page/presentation/views/mobile/admin_page.dart';
import 'package:flutter/material.dart';

class AdminPageView extends StatelessWidget {
  const AdminPageView({super.key});
  static List<String> availableColors = ['red', 'black', 'blue'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Page"), centerTitle: true),
      body: AdminPageMobileLayout(),
    );
  }
}
