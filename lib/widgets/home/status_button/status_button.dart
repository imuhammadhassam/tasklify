import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback? onPressed; // ✅ nullable banado
  final EdgeInsetsGeometry padding;

  const StatusButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.onPressed, // ✅ required hata do
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    required Color textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
