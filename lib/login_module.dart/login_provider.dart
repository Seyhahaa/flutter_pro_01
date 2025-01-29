import 'package:flutter/material.dart';
import 'package:flutter_card/login_module.dart/api_app.dart';
import 'package:flutter_card/login_module.dart/api_login_screen.dart';
import 'package:flutter_card/login_module.dart/login_logic.dart';
import 'package:provider/provider.dart';

Widget loginProvider(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginLogic())
  ],
  child: ApiApp(),
  );
}