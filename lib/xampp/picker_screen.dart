import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picker Screen"),
        backgroundColor: Colors.amber,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: ImagePickerWidget(
        diameter: 240,
        shape: ImagePickerWidgetShape.square, //.circle
        isEditable: true,
        onChange: (File file) {
          print("I changed the file to: ${file.path}");
        },
      ),
    );
  }
}