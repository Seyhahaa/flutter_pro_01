import 'package:flutter/material.dart';
import 'package:flutter_card/event_module/event_logic.dart';
import 'package:flutter_card/event_module/event_screen.dart';
import 'package:flutter_card/user_module.dart/user_splashscreen.dart';
import 'package:provider/provider.dart';

class EventApp extends StatefulWidget {
  const EventApp({super.key});

  @override
  State<EventApp> createState() => _EventAppState();
}

class _EventAppState extends State<EventApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _buildLoadingScreen(),
    );
  }

  Widget _buildLoadingScreen() {
    return FutureBuilder(
      future: context.read<EventLogic>().fetchEvents(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return EventsScreen();
        }else{
          return const UserSplashscreen();
        }
      });
  }
  
}