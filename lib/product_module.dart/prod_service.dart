import "package:flutter/foundation.dart";
import "package:flutter_card/product_module.dart/prod_module.dart";
import "package:http/http.dart" as http;

class ProductService {
  static Future read(
    {required Function(Future<List<Welcome>>) onRes,
    required Function(Object?) onError,}

  ) async{
    String url = "https://fakestoreapi.com/products";
    try{
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(welcomeFromJson, response.body);
      onRes(data);
      onError(null);
    }catch(e){
      onError(e);
      return;
    }
  }
}