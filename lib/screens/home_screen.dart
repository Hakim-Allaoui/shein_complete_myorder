import 'package:flutter/material.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shein_complete_myorder/utils/tools.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Log in',
          style: HKTextStyles.titleBigBold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: Tools.height,
          width: Tools.width,
          child: SingleChildScrollView(
          child: Container(
            height: Tools.height,
            width: Tools.width,
            child: Column(
                children: [
                  Text(
                    'Email or username',
                    style: HKTextStyles.titleBold,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email oe username',
                      fillColor: Colors.white,
                      filled: true,
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Password',
                    style: HKTextStyles.titleBold,
                  ),
                  GFButton(
                    onPressed: () {},
                    blockButton: true,
                    color: Colors.white,
                    size: 50.0,
                    textStyle: HKTextStyles.titleBold.apply(color: Colors.black, fontSizeFactor: 1.2),
                    text: "Log in",
                    /*icon: Container(
                      height: 20.0,
                      width: 20.0,
                      child: Theme(
                        data: ThemeData(
                          accentColor: Colors.black
                        ),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                      ),
                    ),*/
                  ),
                  Text(
                    'Don\'t have account? sign up\n- Or -',
                    style: HKTextStyles.textNormal,
                    textAlign: TextAlign.center,
                  ),
                  GFButton(
                    onPressed: () {

                    },
                    blockButton: true,
                    color: Colors.white,
                    size: 50.0,
                    textStyle: HKTextStyles.titleBold.apply(color: Colors.black),
                    text: "Continue with Facebook",
                    icon: Container(
                      height: 35.0,
                      width: 35.0,
                      child: SvgPicture.asset(
                          'assets/icons/ic_fb.svg',
                      ),
                    ),
                  ),
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
}
