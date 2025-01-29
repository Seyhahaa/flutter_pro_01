import 'package:flutter/foundation.dart';
import 'package:flutter_card/omdb_module/omdb_model.dart';
import 'package:http/http.dart' as http;



class OmdbService {

  static Future read(
    {required Function(Future<MovieModel>) onRes,
      required Function(Object?) onError,
    }
  ) async{
    String url = "https://www.omdbapi.com/?s=love&apikey=4a1e0f25&page=1";
    try{
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(movieModelFromJson, response.body);
      onRes(data);
      onError(null);
    } catch(e){
      onError(e);
    }
  }

  static Future search(
    {
      required String movieTitle,
      required Function(Future<MovieModel>) onRes,
      required Function(Object?) onError,
    }
  ) async{
    String url = "https://www.omdbapi.com/?apikey=4a1e0f25&s=$movieTitle&page=1";
    try{
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(movieModelFromJson, response.body);
      onRes(data);
      onError(null);
    } catch(e){
      onError(e);
    }
  }
  static Future readByPage({
    int page = 1,
    required Function(Future<MovieModel>) onRes,
    required Function(Object?) onError,
  }) async {
    String url =
        "https://www.omdbapi.com/?apikey=f9aa78ee&s=true+crime&page=$page";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(movieModelFromJson, response.body);
      onRes(data);
      onError(null);
    } catch (e) {
      onError(e);
    }
  }
  
}