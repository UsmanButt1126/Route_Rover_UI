import 'package:flutter/material.dart';

Widget container({required double Height,
  required double Width,
  Color? Color  ,
  Image? image,
  BoxDecoration? boxdecoration,
  required child ,
}){
  return Container(
    height: Height,
    width: Width,
      color: Color ,
    decoration: boxdecoration,
    child: child,

    );

}