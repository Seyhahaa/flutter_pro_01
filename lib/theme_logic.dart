import 'package:flutter/material.dart';

class ThemesLogic extends ChangeNotifier{
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  void changeToSystem() {
    _mode =ThemeMode.system;
    notifyListeners();
  }
  void changeToLight(){
    _mode = ThemeMode.light;
    notifyListeners();
  }
  void changeToDark(){
    _mode = ThemeMode.dark;
    notifyListeners();
  }
}