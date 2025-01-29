import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_card/omdb_module/omdb_model.dart';
import 'package:http/http.dart' as http;

class SearchLogic with ChangeNotifier {
  List<Movie> _movies = [];
  bool _isLoading = false;
  String? _error;

  void setLoading(){
    _isLoading = true;
    notifyListeners();
  }

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> search(String text) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await http.get(
        Uri.parse('https://www.omdbapi.com/?s=$text&apikey=4a1e0f25'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _movies = (data['Search'] as List)
            .map((userData) => Movie.fromJson(userData))
            .toList();
      } else {
        _error = 'Failed to fetch movie';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
