import 'package:flutter/material.dart';

Widget button(
    String name, Color color, VoidCallback? callback, TextStyle textStyle, BuildContext context) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width * 0.6,
    child: ElevatedButton(
      onPressed: callback, // Directly use callback
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Use the passed color
      ),
      child: Text(
        name,
        style: textStyle,
      ),
    ),
  );
}
