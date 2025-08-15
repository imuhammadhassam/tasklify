import 'package:flutter/material.dart';
import 'routes/routes.dart';

import 'views/onboarding/onboarding_screen1.dart';
import 'views/login/login_screen.dart';
import 'views/signup/signup_screen.dart';
import 'views/forgotPassword/forgot_password.dart';
import 'views/otpVerification/otp_verification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen1(),
        AppRoutes.signIn: (context) => LoginScreen(),
        AppRoutes.signUp: (context) => SignUpScreen(),
        AppRoutes.forgotPassword: (context) => ForgotPassword(),
        AppRoutes.otpVerification: (context) => OtpVerification(),
      },
    );
  }
}
