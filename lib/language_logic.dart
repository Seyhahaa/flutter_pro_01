import 'package:flutter/cupertino.dart';
import 'package:flutter_card/language_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LanguageLogic extends ChangeNotifier {
  Language _lang = khmer();
  int _langIndex = 0;
  int get langIndex => _langIndex;
  Language get lang => _lang;

  final _secureStorage = const FlutterSecureStorage();
  final String _key = "LanguageLogic";

  final _langList = [
    khmer(),
    Language(),
  ];

  Future read() async {
    String? data = await _secureStorage.read(key:_key);
      _langIndex = int.parse(data ?? '0');
      _lang = _langList[_langIndex];
  }
  

  void changeToKhmer() {
    _langIndex = 0;
    _secureStorage.write(key: _key, value: _langIndex.toString());
    _lang = _langList[_langIndex];
    notifyListeners();
  }
  
  void changeToEnglish() {
    _langIndex = 1;
    _secureStorage.write(key: _key, value: _langIndex.toString());
    _lang = _langList[_langIndex];
    notifyListeners();
  }
}