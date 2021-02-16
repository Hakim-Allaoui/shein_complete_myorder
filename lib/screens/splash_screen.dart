import 'package:flutter/material.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:shein_complete_myorder/utils/tools.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Tools.getDeviceSize(context);
    return Scaffold(
      body: Container(
        width: Tools.width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SHEIN',
                style: MyTextStyles.titleExtraBold,
              ),
              SizedBox(
                height: Tools.height * 0.02,
              ),
              Text(
                'COMPLETE MY ORDER',
                style: MyTextStyles.subTitleDoubleSpacing,
              ),
              SizedBox(
                height: Tools.height * 0.05,
              ),
              Container(
                width: Tools.width * 0.3,
                child: Theme(
                  data: ThemeData(accentColor: Colors.white),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
