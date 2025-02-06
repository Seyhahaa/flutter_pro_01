import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'item_model.dart';

enum PostMethod{
  insert,
  update,
  delete,
}

class ItemService {
  
  static Future<String> post(Item item, PostMethod method) async {
    String key = "d033e22ae348aeb5660fc2140aec35850c4da997";
    String url = "http://10.0.3.2:80/flutter/${method.name}.php?key=$key";
    try {
      http.Response response = await http.post(Uri.parse(url), body: item.toJson());
      final output = json.decode(response.body);
      if(output["success"] != null){
        return output["success"];
      }else{
        throw Exception(output["error"]);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserRandom> search(
    String keyword, {
    required void Function(Object?) onError,
  }) async {
    String url = "http://10.0.3.2:80/flutter/search.php?q=$keyword";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(userRandomFromJson, response.body);
      onError(null);
      return data;
    } catch (e) {
      onError(e);
      return UserRandom(items: []);
    }
  }

  
}