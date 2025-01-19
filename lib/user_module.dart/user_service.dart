// import 'package:flutter_card/user_module.dart/user_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class EventService {
//   final String baseUrl = 'https://backend.wegokh.online';

//   Future<List<Event>> fetchEvents() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/event/all-events'));
      
//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         return data.map((json) => Event.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load events: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error fetching events: $e');
//     }
//   }
// }