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
          style: MyTextStyles.titleBigBold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Tools.height * 0.8,
            width: Tools.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email or username',
                        style: MyTextStyles.titleBold,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'Password',
                        style: MyTextStyles.titleBold,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GFButton(
                      onPressed: () {},
                      blockButton: true,
                      color: Colors.white,
                      size: 50.0,
                      shape: GFButtonShape.pills,
                      textStyle: MyTextStyles.titleBold
                          .apply(color: Colors.black, fontSizeFactor: 1.2),
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
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have account?',
                          style: MyTextStyles.textNormal,
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: (){
                            print('Sign up clicked !!');
                          },
                          child: Text(
                            ' sign up',
                            style: MyTextStyles.textNormal.apply(color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '- Or -',
                      style: MyTextStyles.textNormal,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    GFButton(
                      onPressed: () {},
                      blockButton: true,
                      color: Colors.white,
                      size: 50.0,
                      shape: GFButtonShape.pills,
                      textStyle: MyTextStyles.titleBold
                          .apply(color: Colors.black, fontSizeFactor: 1.2),
                      text: "Continue with Facebook",
                      icon: Row(
                        children: [
                          Container(
                            height: 35.0,
                            width: 35.0,
                            child: SvgPicture.asset(
                              'assets/icons/ic_fb.svg',
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
