
import 'package:flutter/material.dart';
import 'package:flutter_card/api_module/api_service.dart';
import 'package:flutter_card/api_module/post_model.dart';

class PostLogic extends ChangeNotifier{
  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList ;

  bool loading = false;
  bool get isLoading => loading;

  void setLoading(){
    loading = true;
    notifyListeners();
  }

  // Future read()async{
  //   _postList = await PostService.getOnlineData();
  //   loading = false;
  //   notifyListeners();
  // }
  Object? _errorObject;
  Object? get errorObject => _errorObject;

  Future read() async {
    await PostService.getOnlineData(
      onResponse: (response) async {
        _postList = await response;
        loading = false;
        notifyListeners();
      },
      onError: (error) async {
        _errorObject = error;
        loading = false;
        notifyListeners();
      },
    );
  }
}