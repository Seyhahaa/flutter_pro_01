import 'package:flutter/material.dart';

class UserSplashscreen extends StatelessWidget {
  const UserSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.shop, size: 100,),
      ),
    );
  }
}