import 'package:flutter/material.dart';
import 'package:flutter_card/login_module.dart/api_login_screen.dart';
import 'package:flutter_card/login_module.dart/login_splashscreen.dart';

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: _buildLoadingScreen(),
    );
  }

  Future _readData()async {
    await Future.delayed(const Duration(seconds: 2), () {});
  }

  Widget _buildLoadingScreen() {
    return FutureBuilder(
      future: _readData(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Center(
            child: Text("Error"),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return ApiLoginScreen();
        }else{
          return const LoginSplashscreen();
        }
      },
    );
  }
}