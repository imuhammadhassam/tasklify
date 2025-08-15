import 'package:flutter/material.dart';
import 'package:tasklify/theme/colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: AppColors.buttonColor, // customize as needed
      ),
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    );
  }
}
