import '../../main.dart';
import '../../utils/ResponsiveWidget.dart';
import '../../utils/extension/string_extensions.dart';

import '../../screen/DashboardScreen.dart';
import '../../utils/Common.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/text_styles.dart';
import '../../utils/extension/widget_extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/Images.dart';

class DashHeaderComponent extends StatefulWidget {
  static String tag = '/DashboardHeaderComponent';

  @override
  DashHeaderComponentState createState() => DashHeaderComponentState();
}

class DashHeaderComponentState extends State<DashHeaderComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight + 20,
        padding: EdgeInsets.symmetric(horizontal: mCommonPadding(context), vertical: 0),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.white12, blurRadius: 4.0, offset: Offset(0.0, 0.75))], color: Colors.black),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(app_logo, width: 40, height: 40).cornerRadiusWithClipRRect(8).onTap(() {
                  Navigator.pushNamed(context,DashboardScreen.route);
                }),
                10.width,
                Text(builderResponse.appName.validate(), style: boldTextStyle(color: Colors.white, size: 20)),
              ],
            ),
          ],
        ));
  }
}
