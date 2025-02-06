import 'package:flutter/material.dart';

import 'picker_screen.dart';

class PickerApp extends StatefulWidget {
  const PickerApp({super.key});

  @override
  State<PickerApp> createState() => _PickerAppState();
}

class _PickerAppState extends State<PickerApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PickerScreen(),
    );
  }
}