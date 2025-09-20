import 'package:auto_swift/Core/utils/app_route.dart';
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:auto_swift/Features/auth_page/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key, required this.emailController, required this.passwordController, required this.state});
  final AuthState state;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        spacing: 12,
        children: [
          Icon(Icons.lock_outlined, size: 100),
          CustomTextField(hintText: "Email", controller: emailController),
          CustomTextField(hintText: "Password", controller: passwordController),
          AbsorbPointer(
            absorbing: state is AuthLoading,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: state is AuthLoading ? CircularProgressIndicator.adaptive() : const Text("Login"),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.pushReplacement(AppRoute.signup);
            },
            child: Text(
              "Create Account",
              style: AppStyles.styleSemiBold18(context).copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
