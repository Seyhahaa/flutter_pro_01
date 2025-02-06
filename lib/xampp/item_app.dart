import 'package:flutter/material.dart';

import 'item_search_screen.dart';

class ItemApp extends StatefulWidget {
  const ItemApp({super.key});

  @override
  State<ItemApp> createState() => _ItemAppState();
}

class _ItemAppState extends State<ItemApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ItemSearchScreen(),
    );
  }  
}