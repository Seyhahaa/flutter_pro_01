import 'package:flutter/cupertino.dart';
import 'package:flutter_card/event_module/event_app.dart';
import 'package:flutter_card/event_module/event_logic.dart';
import 'package:provider/provider.dart';

Widget eventProvider(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => EventLogic()),
  ],
  child: const EventApp(),
  );
}