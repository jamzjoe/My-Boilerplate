import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.text, required this.size}) : super(key:
  key);
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: size,
    ),);
  }
}