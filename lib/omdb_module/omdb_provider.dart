import 'package:flutter/cupertino.dart';
import 'package:flutter_card/omdb_module/api_logic.dart';
import 'package:flutter_card/omdb_module/omdb_app.dart';
import 'package:flutter_card/omdb_module/search_logic.dart';
import 'package:provider/provider.dart';

Widget omdbProvider(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OmdbLogic()),
    ChangeNotifierProvider(create: (_) => SearchLogic()),
  ],
  child: const OmdbApp(),
  );
}