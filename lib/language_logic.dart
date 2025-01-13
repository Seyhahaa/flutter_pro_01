import 'package:flutter/cupertino.dart';
import 'package:flutter_card/language_data.dart';

class LanguageLogic extends ChangeNotifier {
  Language _lang = khmer();
  int _langIndex = 0;
  int get langIndex => _langIndex;
  Language get lang => _lang;
  

  void changeToKhmer() {
    _lang = khmer();
    _langIndex = 0;
    notifyListeners();
  }
  
  void changeToEnglish() {
    _lang = Language();
    _langIndex = 1;
    notifyListeners();
  }
}