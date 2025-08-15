import 'package:flutter/widgets.dart';

abstract class AppUnits {
  static double iconSize = 24.0;

  //spaces
  static SizedBox y4 = SizedBox(height: 4);
  static SizedBox y8 = SizedBox(height: 8);
  static SizedBox y12 = SizedBox(height: 12);
  static SizedBox y16 = SizedBox(height: 16);
  static SizedBox y20 = SizedBox(height: 20);
  static SizedBox y24 = SizedBox(height: 24);

  static SizedBox x4 = SizedBox(width: 4);
  static SizedBox x8 = SizedBox(width: 8);
  static SizedBox x12 = SizedBox(width: 12);
  static SizedBox x16 = SizedBox(width: 16);
  static SizedBox x20 = SizedBox(width: 20);

  //Paddings
  static EdgeInsets b24 = EdgeInsets.symmetric(horizontal: 24);
  static EdgeInsets a4 = EdgeInsets.all(4);
  static EdgeInsets a8 = EdgeInsets.all(8);
  static EdgeInsets a12 = EdgeInsets.all(12);
  static EdgeInsets a16 = EdgeInsets.all(16);
  static EdgeInsets a20 = EdgeInsets.all(20);
  static EdgeInsets a24 = EdgeInsets.all(24);
  static EdgeInsets a32 = EdgeInsets.all(32);
}
