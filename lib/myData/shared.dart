import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget navigatorTo(context , screen){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => screen));
}
Widget navigatorAndReplacment(context , screen){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => screen));
}
String token = '';
