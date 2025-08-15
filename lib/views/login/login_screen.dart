import 'package:flutter/material.dart';
import 'package:tasklify/routes/routes.dart';
import 'package:tasklify/theme/colors.dart';
import 'package:tasklify/theme/typography.dart';
import 'package:tasklify/theme/units.dart';
import 'package:tasklify/widgets/b2.dart';
import 'package:tasklify/widgets/custom_button.dart';
import 'package:tasklify/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:tasklify/widgets/form_label.dart';
import 'package:tasklify/widgets/h1.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: AppUnits.b24,
          child: Column(
            children: [
              AppUnits.y20,

              H1("Welcome Back"),

              AppUnits.y4,

              B2("Log in to continue using the app"),

              AppUnits.y16,

              FormLabel(label: "Email"),

              AppUnits.y4,

              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),

              AppUnits.y16,

              FormLabel(label: "Password"),

              AppUnits.y4,

              CustomTextField(
                hintText: 'Enter password',
                controller: passwordController,
                obscureText: true,
              ),

              AppUnits.y8,

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPassword);
                  },
                  child: Text(
                    "Forgot password?",
                    style: AppText.b2.copyWith(color: AppColors.textColor),
                  ),
                ),
              ),

              AppUnits.y16,

              CustomButton(text: "Sign In", onTap: () {}),

              AppUnits.y16,

              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: AppText.b2.copyWith(color: AppColors.textColor),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: AppText.b2.copyWith(color: AppColors.buttonColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
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
