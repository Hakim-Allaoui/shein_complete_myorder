import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shein_complete_myorder/providers/auth_provider.dart';
import 'package:shein_complete_myorder/screens/about_page.dart';
import 'package:shein_complete_myorder/screens/auth_screen.dart';
import 'package:shein_complete_myorder/screens/home_screen.dart';
import 'package:shein_complete_myorder/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

var routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomePage(),
  '/auth': (BuildContext context) => AuthPage(),
  '/about': (BuildContext context) => AboutPage(),
  '/privacy': (BuildContext context) => AuthPage(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(builder: (context, auth, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
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
          home: auth.isAuth
              ? FutureBuilder(
                  future: Future.delayed(Duration(seconds: 10)),
                  builder: (context, snapshot) {
                    return HomePage();
                  })
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthPage(),
                ),
        );
      }),
    );
  }
}
