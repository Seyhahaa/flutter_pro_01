import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_card/xampp/item_model.dart';
import 'package:flutter_card/xampp/item_service.dart';

class ItemLogic extends ChangeNotifier {
  UserRandom _itemModel = UserRandom(items: []);
  UserRandom get itemModel => _itemModel;

  bool _loading = false;
  bool get loading => _loading;

  Object? _error;
  Object? get error => _error;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future search(String keyword) async {
    try {
      _itemModel = await ItemService.search(keyword, onError: (Object? err) {
        _error = err;
        debugPrint("_itemModel.items.length: ${_itemModel.items.length}");
        _loading = false;
      });
    } catch (err) {
      _itemModel = UserRandom(items: []);
      _error = err;
      _loading = false;
    }

    debugPrint("another _itemModel.items.length: ${_itemModel.items.length}");
    notifyListeners();
  }
}