import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tasklify/routes/app_routes.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_typography.dart';
import 'package:tasklify/theme/app_units.dart';
import 'package:tasklify/widgets/text/b2.dart';

import 'package:tasklify/widgets/form/custom_button.dart';
import 'package:tasklify/widgets/text/h1.dart';

class OtpVerification extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  OtpVerification({super.key});

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

              H1("OTP Verification"),

              AppUnits.y4,

              B2("Enter the verification code sent to your email"),

              AppUnits.y16,

              Pinput(
                length: 6,
                showCursor: true,
                // onChanged: (value) {
                //   print(value);
                // },

                // onCompleted: (pin) {
                //   print('OTP Entered: $pin');
                // },
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              AppUnits.y20,

              CustomButton(text: "Verify", onTap: () {}),

              AppUnits.y16,

              RichText(
                text: TextSpan(
                  text: "Did'nt recieve code ? ",
                  style: AppText.b2.copyWith(color: AppColors.textColor),
                  children: [
                    TextSpan(
                      text: "Resend",
                      style: AppText.b2.copyWith(color: AppColors.buttonColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.forgotPassword,
                          );
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
