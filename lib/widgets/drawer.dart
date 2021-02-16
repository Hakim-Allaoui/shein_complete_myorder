import 'package:facebook_clone_flutter_app/providers/auth_provider.dart';
import 'package:facebook_clone_flutter_app/utils/navigator.dart';
import 'package:facebook_clone_flutter_app/utils/strings.dart';
import 'package:facebook_clone_flutter_app/utils/theme.dart';
import 'package:facebook_clone_flutter_app/utils/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HKDrawer {
  static VoidCallback onClicked;

  static Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Consumer<Auth>(builder: (context, auth, _) {
        return Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: -MediaQuery.of(context).size.width * 0.9,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 1.5,
                        width: MediaQuery.of(context).size.width * 1.5,
                        decoration: BoxDecoration(
                          color: Palette.gradient1.withOpacity(0.8),
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Color(0xff0884FF),
                              Color(0xff9D35FF),
                              Color(0xffFF6868),
                            ],
                            center: Alignment.bottomLeft,
                            radius: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image.asset(
                        'assets/icon.png',
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.0, top: 10.0),
                        child: Text(
                          Strings.appName,
                          style:
                              MyTextStyles.titleBold.apply(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              auth.isAuth
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Palette.greyLight
                              ),
                              child: Icon(
                                Icons.person,
                                color: Palette.greyDark,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User : ${auth.userName}',
                                  // 'Username',
                                  style: MyTextStyles.titleBold,
                                ),
                                Text(
                                  '${auth.userEmail}',
                                  // 'exemple@gmail.com',
                                  style: MyTextStyles.subTitle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          if (onClicked != null) onClicked();
                          HKNavigator.goHome(context);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/home.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.home,
                              style: MyTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          var url =
                              'https://play.google.com/store/apps/details?id=' +
                                  Strings.packageName;
                          Tools.launchURL(url);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/rate.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.rate,
                              style: MyTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          var url;
                          if (Strings.storeId != "") {
                            url = 'https://play.google.com/store/apps/dev?id=' +
                                Strings.storeId;
                          } else {
                            url =
                                'https://play.google.com/store/apps/developer?id=' +
                                    Strings.storeName.split(' ').join('+');
                          }
                          Tools.launchURL(url);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/more.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.more,
                              style: MyTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          if (onClicked != null) onClicked();
                          HKNavigator.goPrivacy(context);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/privacy_policy.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.privacy,
                              style: MyTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          if (onClicked != null) onClicked();
                          HKNavigator.goAbout(context);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/about.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              Strings.about,
                              style: MyTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100.0),
                        ),
                        onPressed: () async {
                          if(auth.isAuth) await auth.logout();
                          HKNavigator.goAuth(context);
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/logout.svg',
                              width: 30.0,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              auth.isAuth ? Strings.logout : Strings.login,
                              style: MyTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Version ' + Strings.version,
                  style: MyTextStyles.subTitle.apply(fontSizeFactor: 0.8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Build number ' + Strings.buildNumber,
                  style: MyTextStyles.subTitle.apply(fontSizeFactor: 0.8),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
