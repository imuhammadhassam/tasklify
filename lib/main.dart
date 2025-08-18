import 'package:flutter/material.dart';
import 'package:tasklify/views/onboarding/onboarding_screen.dart';
import 'routes/app_routes.dart';
import 'views/login/login_screen.dart';
import 'views/signup/signup_screen.dart';
import 'views/forgot_password/forgot_password.dart';
import 'views/otp_verification/otp_verification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      routes: {
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.signIn: (context) => LoginScreen(),
        AppRoutes.signUp: (context) => SignUpScreen(),
        AppRoutes.forgotPassword: (context) => ForgotPassword(),
        AppRoutes.otpVerification: (context) => OtpVerification(),
      },
    );
  }
}
