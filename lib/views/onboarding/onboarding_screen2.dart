import 'package:flutter/material.dart';
import 'package:tasklify/routes/routes.dart';
import 'package:tasklify/theme/colors.dart';
import 'package:tasklify/theme/units.dart';
import 'package:tasklify/utils/static_assets.dart';
import '../../widgets/skip_button.dart';
import '../../widgets/next_button.dart';
import 'onboarding_screen3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
                StaticAssets.image(StaticAssets.image2),

                AppUnits.y24,

                const Text(
                  "Do Less, Better",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                AppUnits.y12,

                const Text(
                  "Build habits, track progress, and stay consistent with ease.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                ),
              ],
            ),

            AppUnits.y20,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkipButton(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signIn);
                  },
                ),
                NextButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen3(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
