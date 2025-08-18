import 'package:flutter/material.dart';
import 'package:tasklify/utils/textfield_validators.dart';
import 'package:tasklify/routes/app_routes.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_typography.dart';
import 'package:tasklify/theme/app_units.dart';
import 'package:tasklify/widgets/text/b2.dart';
import 'package:tasklify/widgets/form/custom_button.dart';
import 'package:tasklify/widgets/form/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:tasklify/widgets/form/form_label.dart';
import 'package:tasklify/widgets/text/h1.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  void _submitLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //  check if form is valid
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Successful ")));

      // WE CAN add here firebase login and navigation here
      // Navigator.pushNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: AppUnits.b24,
          child: Form(
            key: _formKey,
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
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  validator: Validators.emailValidator,
                ),

                AppUnits.y16,

                FormLabel(label: "Password"),

                AppUnits.y4,

                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  isPassword: true,
                  icon: Icons.lock,
                  validator: Validators.passwordValidator,
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

                CustomButton(
                  text: "Sign In",
                  onTap: () => _submitLogin(context),
                ),

                AppUnits.y16,

                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppText.b2.copyWith(color: AppColors.textColor),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: AppText.b2.copyWith(
                          color: AppColors.buttonColor,
                        ),
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
      ),
    );
  }
}
