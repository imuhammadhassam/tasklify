import 'package:flutter/material.dart';
import 'package:tasklify/theme/app_colors.dart';

// ✅ Reusable Card Widget
class TaskCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.buttonColor),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.buttonColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
