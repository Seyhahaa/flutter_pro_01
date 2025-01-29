import 'package:flutter/material.dart';
import 'package:flutter_card/omdb_module/api_logic.dart';
import 'package:flutter_card/omdb_module/omdb_screen.dart';
import 'package:flutter_card/user_module.dart/user_splashscreen.dart';
import 'package:provider/provider.dart';

class OmdbApp extends StatefulWidget {
  const OmdbApp({super.key});

  @override
  State<OmdbApp> createState() => _OmdbAppState();
}

class _OmdbAppState extends State<OmdbApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildLoadingScreen(),
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return FutureBuilder(
      future: context.read<OmdbLogic>().read(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return const OmdbScreen();
        }else{
          return const UserSplashscreen();
        }
      });
  }
  
}