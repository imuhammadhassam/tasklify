import 'package:flutter/material.dart';
import 'views/onboarding screens/onboarding_screen1.dart';
import 'views//login screen/login_screen.dart'; // placeholder
import 'views/signup_screen/signup_screen.dart'; // placeholder

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
      },
    );
  }
}
