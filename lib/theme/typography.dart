import 'package:flutter/material.dart';

abstract class AppText {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Body
  static const TextStyle b1 = TextStyle(fontSize: 16);
  static const TextStyle b2 = TextStyle(fontSize: 14);
  static const TextStyle b3 = TextStyle(fontSize: 12);

  // Labels
  static const TextStyle l1 = TextStyle(fontSize: 10);
  static const TextStyle l2 = TextStyle(fontSize: 8);
}
