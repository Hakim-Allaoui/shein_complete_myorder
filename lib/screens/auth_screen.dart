import 'package:flutter/material.dart';
import 'package:shein_complete_myorder/utils/navigator.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shein_complete_myorder/utils/tools.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shein_complete_myorder/widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';

enum AuthMode { SignUp, Login }

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'username': '',
  };
  var _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'login'.tr(),
          style: MyTextStyles.titleBigBold,
        ),
        centerTitle: true,
      ),
      drawer: HKDrawer.buildDrawer(context),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: Tools.width,
            child: SingleChildScrollView(
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
                          'Email',
                          style: MyTextStyles.titleBold,
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Password',
                          style: MyTextStyles.titleBold,
                        ),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GFButton(
                        onPressed: () {
                          HKNavigator.goHome(context);
                        },
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
                            onTap: () {
                              print('Sign up clicked !!');
                            },
                            child: Text(
                              ' sign up',
                              style: MyTextStyles.textNormal
                                  .apply(color: Colors.blue),
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
      ),
    );
  }
}
