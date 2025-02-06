import 'package:flutter/material.dart';
import 'package:flutter_card/login_module.dart/loading_screen.dart';

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home: LoadingScreen(),
    );
  }

}