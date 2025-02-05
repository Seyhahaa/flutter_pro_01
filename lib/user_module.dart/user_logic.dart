import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_card/user_module.dart/user_model.dart';

class UserLogic with ChangeNotifier {
  List<Movie> _users = [];
  bool _isLoading = false;
  String? _error;

  void setLoading(){
    _isLoading = true;
    notifyListeners();
  }

  List<Movie> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> read({int page = 1, int limit = 1}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await http.get(
        Uri.parse('https://randomuser.me/api/?results=20&page=1'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _users = (data['results'] as List)
            .map((userData) => Movie.fromJson(userData))
            .toList();
      } else {
        _error = 'Failed to fetch users';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void refreshUsers() {
    read();
  }
}
