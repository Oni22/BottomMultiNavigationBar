import 'package:flutter/widgets.dart';

class PageNavigator {

  static String home = "/";

  PageNavigator({
    this.bottomNavigationIcon,
    this.bottomNavigationText,
    this.onGenerateRoute,
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
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

}