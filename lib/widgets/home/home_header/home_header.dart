import 'package:flutter/material.dart';
import 'package:tasklify/widgets/home/live_date/live_date.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Hello!", style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 4),
        Text(
          "Muhammad Hassam",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),

        LiveDateWidget(),
      ],
    );
  }
}
