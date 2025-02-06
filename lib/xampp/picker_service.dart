import 'dart:convert';

import 'package:http/http.dart' as http;

class PickerService {
  
  static Future<String> upload(String base64Text) async {
    String key = "d033e22ae348aeb5660fc2140aec35850c4da997";
    String url = "http://10.0.3.2:80/flutter/upload.php?key=$key";

    Map<String, dynamic> map = {"base64":base64Text};

    try {
      http.Response response = await http.post(Uri.parse(url), body: map);
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
}