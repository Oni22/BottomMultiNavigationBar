import 'package:flutter/widgets.dart';

class FlutterIntent {

  Map<String,dynamic> _extras = {};
  BuildContext context;
  String name;
  dynamic _object;

  FlutterIntent({
    @required this.context,
    @required this.name
  });

  FlutterIntent.withNoContext({this.name});

  void putExtra(String key, dynamic value) {
    _extras[key] = value;
  }

  void putObjectExtra(dynamic object) {
    _object = object;
  }

  T getObjectExtra<T>() => _object as T;

  String getStringExtra(String key, {String defaultValue = ""}) {
    if(_extras.containsKey(key)) {
      return _extras[key] as String;
    }
    return defaultValue;
  }

  bool getBoolExtra(String key, {bool defaultValue = false}) {
    if(_extras.containsKey(key)) {
      return _extras[key] as bool;
    }
    return defaultValue;
  }

  int getIntExtra(String key, {int defaultValue = 0}) {
    if(_extras.containsKey(key)) {
      return _extras[key] as int;
    }
    return defaultValue;
  }

  double getDoubleExtra(String key, {double defaultValue = 0.0}) {
    if(_extras.containsKey(key)) {
      return _extras[key] as double;
    }
    return defaultValue;
  }

  dynamic getExtra<T>(String key) {
    if(_extras.containsKey(key)) {
      return _extras[key] as T;
    }
    return null;
  }

  void startActivity() {
    Navigator.pushNamed(context, name,arguments: this);
  }

  bool hasData () {
    return _extras.isNotEmpty || _object != null;
  }

  static asRootNavigator(BuildContext context,page) {
    Navigator.of(context,rootNavigator: true).pushNamed(page);
  }

}

class FlutterIntentService {
  FlutterIntentService({
    this.onIntent
  });

  static convertToIntentService(RouteSettings settings,Widget Function(FlutterIntent intent) builder) {
    builder(settings.arguments);
  }

  Widget Function(FlutterIntent intent) onIntent;

}