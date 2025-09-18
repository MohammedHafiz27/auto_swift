import 'package:auto_swift/Core/utils/app_theme.dart';
import 'package:auto_swift/Features/home_page/presentation/view/home_page.dart';
import 'package:auto_swift/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme.copyWith(scaffoldBackgroundColor: Colors.white),
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}
