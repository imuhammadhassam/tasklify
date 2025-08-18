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

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpScreen({super.key});

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //we can save the data in firebase from here
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      print("Valid Form Data:");
      print("Name: $name");
      print("Email: $email");
      print("Password: $password");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup Successful")));

      // Navigator.pushNamed(context, AppRoutes.signIn);
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
                H1("Let's Get Started"),

                AppUnits.y4,

                B2("Create an account to get started"),

                AppUnits.y16,

                FormLabel(label: "Username"),

                AppUnits.y4,

                CustomTextField(
                  controller: nameController,
                  hintText: "Name",
                  icon: Icons.person,
                  validator: Validators.nameValidator,
                ),

                AppUnits.y12,

                FormLabel(label: "Email"),

                AppUnits.y4,

                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  validator: Validators.emailValidator,
                ),

                AppUnits.y12,

                FormLabel(label: "Password"),

                AppUnits.y4,

                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  isPassword: true,
                  icon: Icons.lock,
                  validator: Validators.passwordValidator,
                ),

                AppUnits.y12,

                FormLabel(label: "Confirm Password"),

                AppUnits.y4,

                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (value) => Validators.confirmPasswordValidator(
                    value,
                    passwordController.text,
                  ),
                ),

                AppUnits.y12,

                CustomButton(
                  text: "Sign up",
                  onTap: () {
                    _submitForm(context);
                    //Navigator.pushNamed(context, AppRoutes.signIn);
                  },
                ),

                AppUnits.y16,

                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: AppText.b2.copyWith(color: AppColors.textColor),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: AppText.b2.copyWith(
                          color: AppColors.buttonColor,
                        ),
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
      ),
    );
  }
}
