import 'package:shein_complete_myorder/utils/consts.dart';
import 'package:shein_complete_myorder/utils/theme.dart';
import 'package:shein_complete_myorder/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _stars = 0;

  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        _stars >= starCount ? Icons.star : Icons.star_border,
        size: 30.0,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        print(starCount);
        if (starCount >= 4) {
          Navigator.pop(context);
          var url =
              'https://play.google.com/store/apps/details?id=' + package_name;
          Tools.launchURL(url);
        }
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/icon.png'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'app_name'.tr(),
                      style:
                          MyTextStyles.titleBold.apply(color: Palette.accent),
                    ),
                    Text(
                      'version $version($build_number)',
                      style: MyTextStyles.textNormal,
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'rating_text'.tr(),
              textAlign: TextAlign.center,
              style: MyTextStyles.textNormal,
            ),
            Text(
              '👇 Please Rate App 👇',
              textAlign: TextAlign.center,
              style: MyTextStyles.textNormal,
            ),
          ],
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildStar(1),
          _buildStar(2),
          _buildStar(3),
          _buildStar(4),
          _buildStar(5),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'CANCEL',
            style: MyTextStyles.titleBold.apply(color: Palette.gradient1),
          ),
          onPressed: () {
            Navigator.pop(context, 0);
          },
        ),
        FlatButton(
          child: Text(
            'OK',
            style: MyTextStyles.titleBold.apply(color: Palette.gradient3),
          ),
          onPressed: () {
            Navigator.of(context).pop(_stars);
          },
        )
      ],
    );
  }
}
