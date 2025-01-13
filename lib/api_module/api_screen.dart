import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/api_module/task_screen.dart';

class ApiApp extends StatelessWidget{
  const ApiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow
        )
      ),
    );
  }
}