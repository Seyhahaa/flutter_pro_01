import 'package:flutter/material.dart';
import 'package:flutter_card/xampp/item_app.dart';
import 'package:provider/provider.dart';

import 'item_logic.dart';


Widget itemProvider() { 
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ItemLogic()),
    ],
    child: const ItemApp(),
  );
}