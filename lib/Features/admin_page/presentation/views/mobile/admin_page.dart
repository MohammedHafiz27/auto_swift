import 'package:auto_swift/Core/utils/app_route.dart';
import 'package:auto_swift/Features/admin_page/presentation/views/widgets/car_form.dart';
import 'package:auto_swift/Features/auth_page/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              IconButton(onPressed: (){
                                context.read<AuthCubit>().signOut();
                
                context.go(AppRoute.authPage);
              }, icon: Icon(Icons.login_outlined)),
            ],
          ),
          CarForm(),
        ],
      ),
    );
  }
}
