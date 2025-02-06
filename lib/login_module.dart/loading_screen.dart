import 'package:flutter/material.dart';
import 'package:flutter_card/Home.dart';
import 'package:flutter_card/login_module.dart/api_login_screen.dart';
import 'package:flutter_card/login_module.dart/login_logic.dart';
import 'package:flutter_card/login_module.dart/login_model.dart';
import 'package:flutter_card/login_module.dart/login_splashscreen.dart';
import 'package:flutter_card/login_screen.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future _readData() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    await context.read<LoginLogic>().read();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _readData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          LoginResponseModel responseModel =
              context.watch<LoginLogic>().getResponseModel;
          if (responseModel.token == null) {
            return ApiLoginScreen();
          }
          else{
            debugPrint("responseModel.token: ${responseModel.token}");
            return HomeApp();
          }
        } else {
          return const LoginSplashscreen();
        }
      },
    );
  }

  
}