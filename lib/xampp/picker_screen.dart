import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/xampp/utile.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

import 'picker_service.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  bool _posting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Picker Screen"),
        backgroundColor: Colors.amber,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildUploadButton() {
    return AbsorbPointer(
      absorbing: _posting,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (_base64Text.isNotEmpty) {
                    setState(() {
                      _posting = true;
                    });

                    await Future.delayed(const Duration(seconds: 1), () {});

                    PickerService.upload(_base64Text).then((value) {
                      showSnackBar(context, value);
                      setState(() {
                        _posting = false;
                      });
                    }).onError((error, stack) {
                      showSnackBar(context, error.toString());
                      setState(() {
                        _posting = false;
                      });
                    });
                  } else {
                    showSnackBar(context, "Image not selected");
                  }
                },
                child:const Icon(Icons.upload),
              ),
            ],
          ),
          _posting ? const CircularProgressIndicator() : const SizedBox(),
        ],
      ),
    );
  }

  String _base64Text = "";

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUploadButton(),
          _buildImagePicker(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              physics:const BouncingScrollPhysics(),
              child: Text(
                _base64Text,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker() {
    return ImagePickerWidget(
      diameter: 240,
      shape: ImagePickerWidgetShape.square, //.circle
      isEditable: true,
      onChange: (File file) async {
        debugPrint("I changed the file to: ${file.path}");
        Uint8List byteFile = await file.readAsBytes();
        String output = await compute(base64Encode, byteFile);
        setState(() {
          _base64Text = output;
        });
      },
    );
  }
}