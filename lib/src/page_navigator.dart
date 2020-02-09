import 'dart:io';

import 'package:bottommultinavigationbar/src/flutter_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// With the PageNavigator you can specify the style and behavior of your page. 
/// Each PageNavigtor represents a page under the BottomNavigationBar. A PageNavigator
/// has his own navigator which navigates inside the page without leaving the BottomNavigationBar Widget.
/// IMPORTANT: This widget implements two navigation systems. The first one is the onGenerateRoute attribute that you can
/// use as usual. The second one is the FlutterIntentService. This system is especially developed for this package. Please use
/// only one of the systems. So if you want to use the onGenerateRoute attribute the flutterIntentService has to be null and vice versa.
class PageNavigator {

  static String home = "/";

  PageNavigator({
    this.bottomNavigationIcon,
    this.bottomNavigationText,
    this.flutterIntentService,
    this.customPageRoute,
    this.onGenerateRoute,
    this.initialRoute,
    this.backgroundColor,
    this.activeIcon
  });

  Route<dynamic> getNextFromIntent(RouteSettings settings) {
    if(flutterIntentService != null && settings.arguments is FlutterIntent && settings.arguments != null) {
      if(Platform.isAndroid)
        return MaterialPageRoute(builder: (_) => flutterIntentService.onIntent(settings.arguments));
      else 
        return CupertinoPageRoute(builder: (_) => flutterIntentService.onIntent(settings.arguments));
    }
    else if(settings.arguments == null) {
      if(Platform.isAndroid)
        return MaterialPageRoute(builder: (_) => flutterIntentService.onIntent(FlutterIntent.withNoContext(name: "/")));
      else 
        return CupertinoPageRoute(builder: (_) => flutterIntentService.onIntent(FlutterIntent.withNoContext(name: "/")));
    }
    return MaterialPageRoute(builder: (_) => FlutterIntentError(message: "ERROR: The FlutterIntent or the flutterIntenService of the PageNavigator attribute is null"));
  }

  Route<dynamic> Function(RouteSettings) onGenerateRoute;
  String initialRoute;
  Icon bottomNavigationIcon;
  String bottomNavigationText;
  Color backgroundColor;
  Widget activeIcon;
  PageRoute customPageRoute;
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  FlutterIntentService flutterIntentService;
}

class FlutterIntentError extends StatelessWidget {

  final String message;
  const FlutterIntentError({Key key,this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}