import 'package:auto_swift/Core/app_cubit/app_cubit.dart';
import 'package:auto_swift/Core/utils/app_route.dart';
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Features/auth_page/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            "https://cdn.prod.website-files.com/5e9033e54576bc13f0b47167/61d64e78e9f7444162abcbef_image2-min.png",
          ),
        ),
        Text("Boston , New York", style: AppStyles.styleSemiBold14(context)),
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.read<AuthCubit>().signOut();
                
                context.go(AppRoute.authPage);
              },
              icon: Icon(Icons.logout_outlined, size: 28),
            ),
            IconButton(
              onPressed: () {
                context.read<AppCubit>().toggleTheme();
              },
              icon: Icon(
                context.watch<AppCubit>().state == ThemeMode.dark ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
