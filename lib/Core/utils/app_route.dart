import 'package:auto_swift/Features/admin_page/data/models/car_model.dart';
import 'package:auto_swift/Features/home_page/presentation/view/car_details.dart';
import 'package:auto_swift/Features/home_page/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const String home = '/';
  static const String carDetails = '/car_details';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: carDetails,
            builder: (BuildContext context, GoRouterState state) {
              return CarDetails(car: state.extra as CarModel);
            },
          ),
        ],
      ),
    ],
  );
}
