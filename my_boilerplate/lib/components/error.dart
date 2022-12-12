import 'package:flutter/material.dart';
import 'package:my_boilerplate/components/myButton.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.function});
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        function;
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Loading error! Please check your internet connection.'),
            const SizedBox(
              height: 20,
            ),
            MyButton(label: 'Refresh', function: function)
          ],
        ),
      ),
    );
  }
}
