import 'package:expense/core/constants/constants.dart';
import 'package:expense/views/components/auth_button.dart';
import 'package:expense/views/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense/providers/auth_provider.dart';

final signupLoadingProvider = StateProvider<bool>((ref) => false);

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final isLoading = ref.watch(signupLoadingProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 25),
                ),
                const SizedBox(height: 30),
                Image.asset(Constants.logoimage, height: 200),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  hint: 'example@mail.com',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 30),

                /// ✅ Loader or Signup Button
                isLoading
                    ? const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    )
                    : AuthButton(
                      label: "Sign Up",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          ref.read(signupLoadingProvider.notifier).state = true;
                          try {
                            final user = await ref
                                .read(authServiceProvider)
                                .signUp(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );

                            if (context.mounted && user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('🎉 Signup Successful!'),
                                  backgroundColor: Colors.green,
                                ),
                              );

                              await Future.delayed(
                                const Duration(milliseconds: 1000),
                              );

                              if (context.mounted) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/login',
                                );
                              }
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('⚠️ Error: ${e.toString()}'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } finally {
                            ref.read(signupLoadingProvider.notifier).state =
                                false;
                          }
                        }
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
