import 'package:flutter/material.dart';
import 'package:flutter_card/product_module.dart/prod_module.dart';
import 'package:flutter_card/product_module.dart/prod_service.dart';

class ProductLogic extends ChangeNotifier {
  List<Welcome> _prodductList = [];
  List<Welcome> get prodductList => _prodductList;

  bool loading = false;
  bool get isLoading => loading;

  Object? _error;
  Object? get error => _error;

  void setLoading() {
    loading = true;
    notifyListeners();
  }

  Future read() async {
    await ProductService.read(onRes: (item) async {
      _prodductList = await item;
      loading = false;
      notifyListeners();
    }, onError: (error) {
      _error = error;
      loading = false;
      notifyListeners();
    });
  }
}
