import 'package:flutter/material.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_typography.dart';

class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: AppText.b2.copyWith(
          color: AppColors.greyColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
