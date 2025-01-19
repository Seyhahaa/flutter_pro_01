import 'package:flutter/cupertino.dart';
import 'package:flutter_card/user_module.dart/user_app.dart';
import 'package:flutter_card/user_module.dart/user_logic.dart';
import 'package:provider/provider.dart';

Widget userProvider(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserLogic()),
  ],
  child: const UserApp(),
  );
}