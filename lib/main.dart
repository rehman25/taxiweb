import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texi_website/screen/PrivacyPolicyScreen.dart';
import 'package:texi_website/screen/TermAndConditionScreen.dart';
import 'package:url_strategy/url_strategy.dart';
import '../screen/DashboardScreen.dart';
import '../utils/extension/common.dart';
import '../utils/extension/int_extensions.dart';
import '../utils/extension/string_extensions.dart';

import 'model/BuilderResponse.dart';

BuilderResponse builderResponse = BuilderResponse();

PageRouteAnimation? pageRouteAnimationGlobal;
Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
final navigatorKey = GlobalKey<NavigatorState>();

get getContext => navigatorKey.currentState?.overlay?.context;

Future<String> loadBuilderData() async {
  return await rootBundle.loadString('assets/builder.json');
}

Future<BuilderResponse> loadContent() async {
  String jsonString = await loadBuilderData();
  final jsonResponse = json.decode(jsonString);
  return BuilderResponse.fromJson(jsonResponse);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  builderResponse = await loadContent();

  setPathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          child: child!,
        );
      },
      navigatorKey: navigatorKey,
      title: builderResponse.appName.validate(),
      theme: ThemeData(
        fontFamily: GoogleFonts
            .poppins()
            .fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: DashboardScreen.route,
      routes: {
        DashboardScreen.route: (context) => DashboardScreen(),
        PrivacyPolicyScreen.route: (context) => PrivacyPolicyScreen(),
        TermAndConditionScreen.route: (context) => TermAndConditionScreen(),
      },
      home: DashboardScreen(),
    );
  }
}
