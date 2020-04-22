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

  static const String home = "/";

  PageNavigator({
    @required this.bottomNavigationIcon,
    this.bottomNavigationText,
    @required this.onGenerateRoute,
    this.initialRoute,
    this.backgroundColor,
    this.activeIcon
  });

  Route<dynamic> Function(RouteSettings) onGenerateRoute;
  String initialRoute;
  Icon bottomNavigationIcon;
  String bottomNavigationText;
  Color backgroundColor;
  Widget activeIcon;
  PageRoute customPageRoute;
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
}
