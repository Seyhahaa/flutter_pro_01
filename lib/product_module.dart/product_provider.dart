import 'package:flutter/cupertino.dart';
import 'package:flutter_card/product_module.dart/prod_app.dart';
import 'package:flutter_card/product_module.dart/prod_logic.dart';
import 'package:provider/provider.dart';

Widget productProvider(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductLogic()),
  ],
  child: const ProdApp(),
  );
}