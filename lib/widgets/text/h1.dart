import 'package:flutter/material.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_typography.dart';

class H1 extends StatelessWidget {
  final String text;

  const H1(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppText.h1.copyWith(color: AppColors.buttonColor),
      ),
    );
  }
}
