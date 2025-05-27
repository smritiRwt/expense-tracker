import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/components/auth_button.dart';
import 'package:expense/pages/components/custom_text_field.dart';
import 'package:expense/pages/tabbar.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
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
                  label: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Login logic
                      debugPrint("Logging in...");
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const TabbarPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      ),
                  child: Text(
                    "Don't have an account? Sign up",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
