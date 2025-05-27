import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/components/auth_button.dart';
import 'package:expense/pages/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
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
                AuthButton(
                  label: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Signup logic
                      debugPrint("Signing up...");
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
