import 'package:flutter/material.dart';
import 'package:tasklify/theme/app_typography.dart';
import 'package:tasklify/theme/app_colors.dart';

class B2 extends StatelessWidget {
  final String text;

  const B2(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: AppText.b1.copyWith(color: AppColors.textColor)),
    );
  }
}
