import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shein_complete_myorder/utils/tools.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'home'.tr(),
          style: MyTextStyles.titleBigBold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: Tools.height,
          width: Tools.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xffdcaaaa),
                    border: Border.all(
                      color: Color(0xffdc5555),
                      width: 1.0,
                    ),
                  ),
                  child: Markdown(
                    data: 'rating_dialog'.tr(),
                    styleSheet: MarkdownStyleSheet(
                      p: MyTextStyles.textNormal.apply(
                        color: Color(0xffdc5555),
                      ),
                    ),
                    onTapLink: (link) async {
                      if (await canLaunch(link)) {
                        await launch(link);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
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
