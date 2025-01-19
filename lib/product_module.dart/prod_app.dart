import 'package:flutter/material.dart';
import 'package:flutter_card/product_module.dart/prod_logic.dart';
import 'package:flutter_card/product_module.dart/prod_screen.dart';
import 'package:flutter_card/product_module.dart/prod_splashscreen.dart';
import 'package:provider/provider.dart';

class ProdApp extends StatefulWidget {
  const ProdApp({super.key});

  @override
  State<ProdApp> createState() => _ProdAppState();
}

class _ProdAppState extends State<ProdApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildLoadingScreen(),
    );
  }

  Widget _buildLoadingScreen() {
    return FutureBuilder(
      future: context.read<ProductLogic>().read(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return const ProdScreen();
        }else{
          return const ProdSplashscreen();
        }
      });
  }
  
}