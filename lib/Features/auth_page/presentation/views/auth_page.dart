import 'package:auto_swift/Core/functions/get_role.dart';
import 'package:auto_swift/Core/utils/app_route.dart';
import 'package:auto_swift/Core/utils/custom_snack_bar.dart';
import 'package:auto_swift/Features/auth_page/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:auto_swift/Features/auth_page/presentation/views/widgets/auth_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(CustomSnackBar.build(message: state.message, backgroundColor: Colors.red));
          } else if (state is AuthSuccess) {
            emailController.clear();
            passwordController.clear();
            getRoleFromEmail(context.read<AuthCubit>().role) == "admin"
                ? context.push(AppRoute.admin)
                : context.push(AppRoute.home);
          }
        },
        builder: (context, state) {
          return AuthPageBody(emailController: emailController, passwordController: passwordController, state: state);
        },
      ),
    );
  }
}
