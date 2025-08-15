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
      color: AppColors.scaffoldBackgroundColor, // background
      child: SafeArea(
        child: SingleChildScrollView(
          padding: AppUnits.b24,
          child: Column(
            children: [
              H1("Let's Get Started"),

              AppUnits.y4,

              B2("Create an account to get started"),

              AppUnits.y16,

              FormLabel(label: "Username"),

              AppUnits.y4,

              CustomTextField(
                hintText: 'Enter your name',
                controller: nameController,
              ),

              AppUnits.y12,

              FormLabel(label: "Email"),

              AppUnits.y4,

              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),

              AppUnits.y12,

              FormLabel(label: "Password"),

              AppUnits.y4,

              CustomTextField(
                hintText: 'Enter password',
                controller: passwordController,
                obscureText: true,
              ),

              AppUnits.y12,

              FormLabel(label: "Confrim Password"),

              AppUnits.y4,

              CustomTextField(
                hintText: 'Enter confirm password',
                controller: confirmPasswordController,
                obscureText: true,
              ),

              AppUnits.y8,
              AppUnits.y12,

              CustomButton(text: "Sign up", onTap: () {}),

              AppUnits.y16,

              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: AppText.b2.copyWith(color: AppColors.textColor),
                  children: [
                    TextSpan(
                      text: "Sign in",
                      style: AppText.b2.copyWith(color: AppColors.buttonColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, AppRoutes.signIn);
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
