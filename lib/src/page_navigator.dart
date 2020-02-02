import 'package:flutter/widgets.dart';

class PageNavigator {

  static String home = "/";

  PageNavigator({
    this.bottomNavigationIcon,
    this.bottomNavigationText,
    this.onGenerateRoute,
    this.initialRoute
  });

  Route<dynamic> Function(RouteSettings) onGenerateRoute;
  String initialRoute;
  Icon bottomNavigationIcon;
  String bottomNavigationText;
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

}