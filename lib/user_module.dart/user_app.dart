import 'package:flutter/material.dart';
import 'package:flutter_card/user_module.dart/user_logic.dart';
import 'package:flutter_card/user_module.dart/user_screen.dart';
import 'package:flutter_card/user_module.dart/user_splashscreen.dart';
import 'package:provider/provider.dart';

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildLoadingScreen(),
    );
  }

  Widget _buildLoadingScreen() {
    return FutureBuilder(
      future: context.read<UserLogic>().read(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return const UserScreen();
        }else{
          return const UserSplashscreen();
        }
      });
  }
  
}