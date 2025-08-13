import 'package:flutter/material.dart';
import 'package:tasklify/widgets/custom_button.dart';
import 'package:tasklify/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:tasklify/widgets/form_label.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // background
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Let's Get Started ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 1),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create an account to get started",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 16),

              FormLabel(label: "Username"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter your name',
                controller: nameController,
              ),

              const SizedBox(height: 13),

              FormLabel(label: "Email"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),

              const SizedBox(height: 13),

              FormLabel(label: "Password"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter password',
                controller: passwordController,
                obscureText: true,
              ),

              const SizedBox(height: 13),

              FormLabel(label: "Confrim Password"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter confirm password',
                controller: confirmPasswordController,
                obscureText: true,
              ),

              const SizedBox(height: 8),
              const SizedBox(height: 13),

              CustomButton(
                text: "Sign up",
                onTap: () {
                  // TODO: Implement login functionality
                },
              ),

              const SizedBox(height: 16),

              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/Signin');
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



// final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   SignUpScreen({super.key});



