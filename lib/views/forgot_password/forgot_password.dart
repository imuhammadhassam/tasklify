import 'package:flutter/material.dart';
import 'package:tasklify/utils/textfield_validators.dart';
import 'package:tasklify/routes/app_routes.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_units.dart';
import 'package:tasklify/widgets/text/b2.dart';
import 'package:tasklify/widgets/form/custom_button.dart';
import 'package:tasklify/widgets/form/custom_textfield.dart';
import 'package:tasklify/widgets/form/form_label.dart';
import 'package:tasklify/widgets/text/h1.dart';

class ForgotPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ForgotPassword({super.key});
  void _sendCode(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //  check if email is valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Reset code sent to ${emailController.text} 📩"),
        ),
      );

      // we can add firebase reset password logic here
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

                H1("Forgot Password"),

                AppUnits.y4,

                B2(
                  "Enter your email and a reset link will sent to your email address",
                ),

                AppUnits.y20,

                FormLabel(label: "Email"),

                AppUnits.y4,

                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                  validator: Validators.emailValidator,
                ),

                AppUnits.y24,

                CustomButton(
                  text: "Send Code",
                  onTap: () {
                    _sendCode(context);
                    Navigator.pushNamed(context, AppRoutes.otpVerification);
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
