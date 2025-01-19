import 'package:flutter/foundation.dart';
import 'package:flutter_card/event_module/event_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventLogic with ChangeNotifier {
  List<Event> _events = [];
  bool _isLoading = false;
  String _error = '';

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String get error => _error;


  void setLoading(){
    _isLoading = true;
    notifyListeners();
  }

  Future<void> fetchEvents() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://backend.wegokh.online/event/all-events'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['docs'] != null) {
          _events = (data['docs'] as List)
              .map((event) => Event.fromJson(event))
              .toList();
        }
      } else {
        _error = 'Failed to load events';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}