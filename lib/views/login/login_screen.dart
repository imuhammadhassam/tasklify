import 'package:flutter/material.dart';
import 'package:tasklify/widgets/custom_button.dart';
import 'package:tasklify/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:tasklify/widgets/form_label.dart';
import 'package:tasklify/views/forgot_password/forgot_password.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // background
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log in to continue using the app",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 16),

              FormLabel(label: "Email"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),

              const SizedBox(height: 16),

              FormLabel(label: "Password"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter password',
                controller: passwordController,
                obscureText: true,
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ForgotPassword');
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.black, fontSize: 14,),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              CustomButton(text: "Sign In", onTap: () {}),

              const SizedBox(height: 16),

              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/Signup');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
