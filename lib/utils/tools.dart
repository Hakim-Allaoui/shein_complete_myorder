import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tools {
  static double height = 0.0;
  static double width = 0.0;

  static const String battutaKey = 'b8c2d94d526d780fe1ae6a3d888242b9';

  static void getDeviceSize(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}