import 'package:flutter/material.dart';
import 'package:shein_complete_myorder/screens/home_screen.dart';
import 'package:shein_complete_myorder/screens/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomeScreen(),
  '/login': (BuildContext context) => HomeScreen(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SHEIN CMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
        canvasColor: Colors.black,
        backgroundColor: Colors.black,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routes: routes,
      home: SplashScreen(),
    );
  }
}
