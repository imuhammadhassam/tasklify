import 'package:flutter/material.dart';
import 'package:tasklify/widgets/custom_button.dart';
import 'package:tasklify/widgets/custom_textfield.dart';
import 'package:tasklify/widgets/form_label.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ForgotPassword({super.key});

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
                  "Forgot Password ?",
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
                  "Enter your email and a reset link will sent to your email",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              FormLabel(label: "Email"),

              const SizedBox(height: 4),

              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),

              const SizedBox(height: 24),

              CustomButton(text: "Send Code", onTap: () {}),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
