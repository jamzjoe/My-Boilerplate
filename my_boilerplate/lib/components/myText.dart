import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.text, required this.size, this.type})
      : super(key: key);
  final String text;
  final double size;
  final String? type;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: type == 'heading'
              ? FontWeight.bold
              : type == 'light'
                  ? FontWeight.w300
                  : FontWeight.normal),
    );
  }
}
