import 'package:flutter/material.dart';
import 'views/onboarding/onboarding_screen1.dart';
import 'views/login/login_screen.dart'; // placeholder
import 'views/signup/signup_screen.dart'; // placeholder
import 'views/forgot_password/forgot_password.dart'; // placeholder

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen1(),
        '/Signin': (context) => LoginScreen(),
        '/Signup': (context) => SignUpScreen(),
        '/ForgotPassword': (context) => ForgotPassword(),
      },
    );
  }
}
