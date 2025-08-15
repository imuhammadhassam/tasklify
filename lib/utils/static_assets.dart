import 'package:flutter/widgets.dart';

abstract class StaticAssets {
  static const image1 = 'assets/images/onboarding1.jpg';
  static const image2 = 'assets/images/onboarding2.jpg';
  static const image3 = 'assets/images/onboarding3.jpg';

  // Fixed height image helper
  static Widget image(String path) {
    return Image.asset(path, height: 340);
  }
}
