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
    if(flutterIntentService != null && settings.arguments is FlutterIntent && settings.arguments != null)
      return MaterialPageRoute(builder: (_) => flutterIntentService.onIntent(settings.arguments));
    else if(settings.arguments == null) {
      return MaterialPageRoute(builder: (_) => flutterIntentService.onIntent(FlutterIntent.withNoContext(name: "/")));
    }
    return MaterialPageRoute(builder: (_) => FlutterIntentError(message: "Error"));
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