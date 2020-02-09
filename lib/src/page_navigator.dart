import 'package:bottommultinavigationbar/src/flutter_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageNavigator {

  static String home = "/";

  PageNavigator({
    this.bottomNavigationIcon,
    this.bottomNavigationText,
    this.flutterIntentService,
    this.onGenerateRoute,
    this.initialRoute,
    this.backgroundColor,
    this.activeIcon
  });

  Route<dynamic> getNextFromIntent(RouteSettings settings) {
    if(flutterIntentService != null && settings.arguments is FlutterIntent)
      return MaterialPageRoute(builder: (_) => flutterIntentService.onIntent(settings.arguments));
    else return null;
  }

  Route<dynamic> Function(RouteSettings) onGenerateRoute;
  String initialRoute;
  Icon bottomNavigationIcon;
  String bottomNavigationText;
  Color backgroundColor;
  Widget activeIcon;
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  FlutterIntentService flutterIntentService;
}