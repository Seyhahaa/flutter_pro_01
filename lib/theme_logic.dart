import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemesLogic extends ChangeNotifier{
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

   final _secureStorage = const FlutterSecureStorage();
  final String _key = "ThemeLogic";

  final List<ThemeMode> _modeList = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark
  ];

  Future read() async {
    String? data = await _secureStorage.read(key: _key);
      int index = int.parse(data ?? "0");
      _mode = _modeList[index];
      notifyListeners();
    
  }

  void changeToSystem() {
    int index = 0;
    _secureStorage.write(key: _key, value: index.toString());
    _mode = _modeList[index];
    notifyListeners();
  }
  void changeToLight(){
    int index = 1;
    _secureStorage.write(key: _key, value: index.toString());
    _mode = ThemeMode.light;
    notifyListeners();
  }
  void changeToDark(){
    int index = 2;
    _secureStorage.write(key: _key, value: index.toString());
    _mode = ThemeMode.dark;
    notifyListeners();
  }
}