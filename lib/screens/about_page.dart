import 'package:shein_complete_myorder/utils/consts.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:shein_complete_myorder/utils/tools.dart';
import 'package:shein_complete_myorder/widgets/appbar.dart';
import 'package:shein_complete_myorder/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: HKDrawer.buildDrawer(context),
      backgroundColor: Palette.primary,
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -100.0,
            bottom: -100.0,
            child: Opacity(
              child: SvgPicture.asset(
                'assets/icons/about.svg',
                width: 400.0,
              ),
              opacity: 0.2,
            ),
          ),
          Column(
            children: <Widget>[
              CustomAppBar(
                scaffoldKey: scaffoldKey,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'about'.tr(),
                  style: MyTextStyles.titleBigBold.apply(color: Palette.accent),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Markdown(
                  data: about_text,
                  onTapLink: (link) {
                    Tools.launchURL(link);
                  },
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(color: Colors.white),
                    listBullet: TextStyle(color: Colors.white),
                    tableBody: TextStyle(color: Colors.white),
                    h4: TextStyle(color: Colors.white),
                    h6: TextStyle(color: Colors.white),
                    h6Align: WrapAlignment.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
