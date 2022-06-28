import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };
  static const Color backgroundColor = Color(0xFF26ABE2);
  static const Color airportPassengerColor = Color(0xFFF85656);
  static const Color travelingColor = Color(0xFF21B137);
  static const Color assignedButtonColor = Color(0xFF5AC96B);
  static const Color buttonColor = Color(0xFF26ABE2);
  static Color titleColor = Color(0xFF434343).withOpacity(.77);
  static const Color dateColor = Color(0xFFD95B00);
  static const Color nextButtonColor = Color(0xFF5AC96B);
  static const Color priceColor = Color(0xFF9AC12B);
  static const Color disabledColor = Color(0xFFAAAAAA);
  static const Color accentColor = Colors.blue;

}
