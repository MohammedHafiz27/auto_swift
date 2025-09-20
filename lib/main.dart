import 'package:auto_swift/Core/app_cubit/app_cubit.dart';
import 'package:auto_swift/Core/helper/cache_helper.dart';
import 'package:auto_swift/Core/utils/app_route.dart';
import 'package:auto_swift/Core/utils/app_theme.dart';
import 'package:auto_swift/Features/auth_page/data/repo/auth_repo_imple.dart';
import 'package:auto_swift/Features/auth_page/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:auto_swift/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepoImple(firebaseAuth: FirebaseAuth.instance))),
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: BlocBuilder<AppCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            routerConfig: AppRoute.router,
          );
        },
      ),
    );
  }
}
