
import 'package:flutter/foundation.dart';
import 'package:flutter_card/api_module/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  // static Future<List<PostModel>> getOnlineData() async {
  //   String url = "https://jsonplaceholder.typicode.com/posts";
  //   http.Response response = await http.get(Uri.parse(url));
  //   return compute(welcomeFromJson,response.body);
  // }

    static Future getOnlineData({
    required void Function(Future<List<PostModel>>) onResponse,
    required void Function(Object?) onError,
  }) async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final data = compute(welcomeFromJson, response.body);
      onResponse(data);
      onError(null);
    } catch (e) {
      onError(e);
    }
  }
  
}
// List<PostModel> _parse(String body) {
//       List list = json.decode(body);
//     List<PostModel> records = list.map((x) => PostModel.fromMap(x)).toList();

//     return records;
//   }