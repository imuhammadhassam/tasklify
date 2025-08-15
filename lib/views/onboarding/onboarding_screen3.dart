import 'package:flutter/material.dart';
import 'package:tasklify/routes/routes.dart';
import 'package:tasklify/theme/colors.dart';
import 'package:tasklify/theme/units.dart';
import 'package:tasklify/utils/static_assets.dart';
import '../../widgets/custom_button.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
                StaticAssets.image(StaticAssets.image3),

                AppUnits.y4,

                const Text(
                  "Seamless Routine Sync",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                AppUnits.y12,

                const Text(
                  "Manage daily routines, see upcoming tasks and synced tasks.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.greyColor),
                ),
              ],
            ),

            AppUnits.y24,

            CustomButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}
