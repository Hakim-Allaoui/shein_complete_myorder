import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:package_info/package_info.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:logger/logger.dart';

class Tools {
  static double height = 400.0;
  static double width = 200.0;


  static PackageInfo packageInfo = PackageInfo(
    appName: ' ',
    packageName: ' ',
    version: ' ',
    buildNumber: ' ',
  );

  static void getDeviceSize(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  static Future<void> initAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }

  static var logger = Logger(
    printer: PrettyPrinter(methodCount: 1, colors: false, prefix: true),
  );

  static launchURL(String url) async {
    try {
      // if (await canLaunch(url)) {
        await launch(url);
        print('==> lunching url : $url');
      // } else {
      //   throw 'Could not launch $url';
      // }
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  static checkAppVersion(BuildContext context) async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    try {
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();

      String newVersion = remoteConfig.getString('android_app_version');

      double currentVersion =
          double.parse(newVersion.trim().replaceAll(".", ""));
      double installedVersion =
          double.parse(Tools.packageInfo.version.trim().replaceAll(".", ""));

      Tools.logger.w(
          'currentVersion: $currentVersion \ninstalledVersion: $installedVersion');

      if (installedVersion < currentVersion) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Update Available 🎉',
              style: MyTextStyles.titleBold,
            ),
            content: new Text(
              'Update $newVersion is available to download. By downloading the latest update you will get the latest features, improvements and bug fixes.',
              style: MyTextStyles.textNormal,
            ),
            actions: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Palette.accent),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Later',
                        style: TextStyle(
                          color: Palette.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(100.0),
                      gradient: RadialGradient(
                        colors: [
                          Palette.gradient1,
                          Palette.gradient2,
                          Palette.gradient3,
                        ],
                        center: Alignment.bottomLeft,
                        radius: 2.0,
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        var url =
                            'https://play.google.com/store/apps/details?id=' +
                                Tools.packageInfo.packageName;
                        Tools.launchURL(url);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
