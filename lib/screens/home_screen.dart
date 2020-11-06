import 'package:flutter/material.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:getwidget/getwidget.dart';

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
        child: Column(
          children: [
            Container(),
            GFButton(
                onPressed: (){},
                text:"primary"
            ),
          ],
        ),
      ),
    );
  }
}