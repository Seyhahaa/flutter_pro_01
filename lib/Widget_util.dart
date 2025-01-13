

  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget navigate(BuildContext context,{Widget? destination, Widget? child}) {
    return InkWell(
      onTap: () {
        if (destination != null) {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => destination),
          );
        }
      },
      child: child,
    );
  }

   Widget buildRoudedImage(String img){
    return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            img,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        );
  }