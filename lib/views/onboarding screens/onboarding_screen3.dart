import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset("assets/images/onboarding3.jpg", height: 340),
                const SizedBox(height: 32),
                const Text(
                  "Seamless Routine Sync",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Manage daily routines, see upcoming tasks and synced tasks.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            CustomButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Signin');
              },
            ),
          ],
        ),
      ),
    );
  }
}
