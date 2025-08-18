import 'package:flutter/material.dart';
import 'package:tasklify/theme/app_colors.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: const Text(
        "Skip",
        style: TextStyle(fontSize: 16, color: AppColors.greyColor),
      ),
    );
  }
}
