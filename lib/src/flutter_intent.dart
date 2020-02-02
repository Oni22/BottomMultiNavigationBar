import 'package:bottommultinavigationbar/bottommultinavigationbar.dart';
import 'package:flutter/material.dart';

class FlutterIntent {

  Map<String,dynamic> _extras = {};
  BuildContext context;
  String next;

  FlutterIntent({
    this.context,
    this.next
  });

  void putExtra(String key, dynamic value) {
    _extras[key] = value;
  }

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
    Navigator.pushNamed(context, next,arguments: this);
  }

}
