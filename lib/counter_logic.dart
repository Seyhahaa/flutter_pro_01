import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CounterLogic extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  final _secureStorage = const FlutterSecureStorage();
  final String _counterKey = "counterLogic";

  Future read() async {
    String? data = await _secureStorage.read(key: _counterKey);
      _counter = int.parse(data ?? "0");
      notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    _secureStorage.write(key: _counterKey, value: _counter.toString());
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _secureStorage.write(key: _counterKey, value: _counter.toString());
      notifyListeners();
    }
  }
}