
import 'package:flutter/material.dart';
import 'package:flutter_card/login_module.dart/login_model.dart';
import 'package:flutter_card/login_module.dart/login_service.dart';

class LoginLogic extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  Object? _error;
  Object? get getError => _error;

  void setLoading(){
    _loading = true;
    notifyListeners();
  }

  Future<LoginResponseModel> login(String username, String password) async {
    LoginRequestModel requestModel = LoginRequestModel(
      username: username.trim(),
      password: password.trim(),
    );
    LoginResponseModel _responseModel = LoginResponseModel();

    await LoginService.login(
      request: requestModel,
      onRes: (value) async {
        _responseModel = await value;
        _loading = false;
        notifyListeners();
      },
      onError: (error) async {
        _error = error;
        _loading = false;
        notifyListeners();
      }
    );
    return _responseModel;
  }
}