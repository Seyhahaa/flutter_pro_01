import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: "DONE",
      onPressed: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      },
    ),
  ));
}

goto(BuildContext context, Widget destination) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => destination,
    ),
  );
}