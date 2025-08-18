import 'package:flutter/material.dart';
import 'package:tasklify/routes/app_routes.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_units.dart';
import 'package:tasklify/utils/static_assets.dart';
import 'package:tasklify/widgets/onboarding/next_button.dart';
import 'package:tasklify/widgets/onboarding/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": StaticAssets.image1,
      "title": "Meet TODO++",
      "subtitle": "Stay focused with a to-do list that fits into your routine.",
    },
    {
      "image": StaticAssets.image2,
      "title": "Organize Tasks",
      "subtitle": "Plan your day with smart scheduling and reminders.",
    },
    {
      "image": StaticAssets.image3,
      "title": "Achieve More",
      "subtitle": "Track progress and stay motivated every day.",
    },
  ];

  void _nextPage(BuildContext context) {
    if (currentIndex < onboardingData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushNamed(context, AppRoutes.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: AppUnits.a24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                StaticAssets.image(onboardingData[currentIndex]["image"]!),

                AppUnits.y24,

                Text(
                  onboardingData[currentIndex]["title"]!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                AppUnits.y12,

                Text(
                  onboardingData[currentIndex]["subtitle"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),

            AppUnits.y20,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkipButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
                  },
                ),
                NextButton(onTap: () => _nextPage(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
