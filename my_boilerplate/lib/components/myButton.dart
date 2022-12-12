import 'package:flutter/material.dart';
import 'package:my_boilerplate/components/myText.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label, required this.function});
  final VoidCallback function;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyText(text: label, size: 14),
          )),
    );
  }
}
