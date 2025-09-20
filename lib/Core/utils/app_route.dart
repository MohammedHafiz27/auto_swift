import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/admin_page_view.dart';
import 'package:auto_swift/Features/auth_page/presentation/views/auth_page.dart';
import 'package:auto_swift/Features/auth_page/presentation/views/signup_page.dart';
import 'package:auto_swift/Features/home_page/presentation/view/car_details.dart';
import 'package:auto_swift/Features/home_page/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const String authPage = '/';
  static const String carDetails = '/car_details';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String admin = '/admin';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: carDetails,
            builder: (BuildContext context, GoRouterState state) {
              return CarDetails(car: state.extra as CarModel);
            },
          ),
          GoRoute(
            path: admin,
            builder: (BuildContext context, GoRouterState state) {
              return AdminPageView();
            },
          ),
          GoRoute(
            path: home,
            builder: (BuildContext context, GoRouterState state) {
              return HomePage();
            },
          ),
          GoRoute(
            path: signup,
            builder: (BuildContext context, GoRouterState state) {
              return const SignupPage();
            },
          ),
        ],
      ),
    ],
  );
}
