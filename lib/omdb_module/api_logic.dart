import 'package:flutter/material.dart';
import 'package:flutter_card/omdb_module/omdb_model.dart';
import 'package:flutter_card/omdb_module/omdb_service.dart';


int startingPage = 2;
int resultPerPage = 10;

class OmdbLogic extends ChangeNotifier {
  List<Movie> _records = [];
  List<Movie> get records => _records;

  bool _loading = false;
  bool get loading => _loading;

  Object? _error;
  Object? get error => _error;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  int _page = startingPage; 
  int _totalResults = 0;

  bool _endOfResult = false;
  bool get endOfResult => _endOfResult;

  Future readAppend() async{

    int totalPage = (_totalResults / resultPerPage).toInt();
    if(_page <= totalPage){
      _page++;
      _endOfResult = false;
    }else{
      _endOfResult = true;
    }

    await OmdbService.readByPage(
      page: _page,
      onRes: (value)  async{
        final data = await value;
        _totalResults = int.parse(data.totalResults);
        if(_endOfResult == false){
          _records += data.search;
        }
        _loading = false;
        notifyListeners();
      },
      onError: (err) {
        _error = err;
        _loading = false;
        notifyListeners();
      },
    );
  }

  Future read() async{
    await OmdbService.read(
      onRes: (value)  async{
        final data = await value;
        _records = data.search;
        _loading = false;
        notifyListeners();
      },
      onError: (err) {
        _error = err;
        _loading = false;
        notifyListeners();
      },
    );
  }
}