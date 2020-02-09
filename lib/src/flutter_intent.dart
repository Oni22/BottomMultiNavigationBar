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

  String getStringExtra(String key) {
    return _extras[key] as String;
  }

  bool getBooleanExtra(String key) {
    return _extras[key] as bool;
  }

  int getIntExtra(String key) {
    return _extras[key] as int;
  }

  double getDoubleExtra(String key) {
    return _extras[key] as double;
  }

  dynamic getExtra<T>(String key) {
    return _extras[key] as T;
  }

  void startActivity() {
    Navigator.pushNamed(context, name,arguments: this);
  }

  bool hasData () {
    return _extras.isNotEmpty || _object != null;
  }

}

class FlutterIntentService {
  FlutterIntentService({
    this.onIntent
  });
  static String home;
  Widget Function(FlutterIntent intent) onIntent;

}