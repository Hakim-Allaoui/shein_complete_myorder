import 'package:flutter/material.dart';

class HKColors {
  static const Color primary = Color(0xff000000);
  static const Color accent = Color(0xffffffff);
}

class HKTextStyles {

  static const titleExtraBold = TextStyle(
      fontSize: 48,
      color: Colors.white,
      fontWeight: FontWeight.w700
  );

  static const titleBigBold = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.w700
  );

  static const titleBold = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700
  );

  static const textNormal = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const subTitleDoubleSpacing = TextStyle(
    fontSize: 9,
    color: Colors.white,
    letterSpacing: 3.0
  );
}