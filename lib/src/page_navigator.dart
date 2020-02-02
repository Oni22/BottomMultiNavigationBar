import 'package:flutter/widgets.dart';

class PageNavigator {

  PageNavigator({
    this.bottomNavigationIcon,
    this.bottomNavigationText,
    this.initialRoute,
    this.onGenerateRoute
  });

  Route<dynamic> Function(RouteSettings) onGenerateRoute;
  String initialRoute;
  Icon bottomNavigationIcon;
  String bottomNavigationText;
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

}