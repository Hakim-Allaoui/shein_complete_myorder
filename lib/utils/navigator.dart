import 'package:flutter/material.dart';

class HKNavigator {

  static void goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, '/home');
  }

  static void goAuth(BuildContext context){
    Navigator.pushReplacementNamed(context, '/auth');
  }

  static void goPrivacy(BuildContext context){
    Navigator.pushNamed(context, '/privacy');
  }

  static void goAbout(BuildContext context){
    Navigator.pushNamed(context, '/about');
  }
}