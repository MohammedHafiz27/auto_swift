import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/utils/custom_snack_bar.dart';
import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:auto_swift/Features/auth_page/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
      appBar: AppBar(title: const Text("Sign Up")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailureSignup) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(CustomSnackBar.build(message: state.message, backgroundColor: Colors.red));
          } else if (state is AuthSuccessSignup) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(CustomSnackBar.build(message: 'Successfully Signed Up', backgroundColor: Colors.green));
            emailController.clear();
            passwordController.clear();
            context.pop();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 12,
              children: [
                Icon(Icons.lock_outline, size: 100),
                CustomTextField(hintText: "Email", controller: emailController),
                CustomTextField(hintText: "Password", controller: passwordController),
                AbsorbPointer(
                  absorbing: state is AuthLoadingSignup,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signUpWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                    child: state is AuthLoadingSignup ? CircularProgressIndicator.adaptive() : Text("Sign Up"),
                  ),
                ),
                Text(
                  "Already have an account? Login",
                  style: AppStyles.styleSemiBold18(context).copyWith(decoration: TextDecoration.underline),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
