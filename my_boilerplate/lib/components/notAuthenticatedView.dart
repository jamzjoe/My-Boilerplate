import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/components/myButton.dart';
import 'package:my_boilerplate/components/myText.dart';

class NotAuthenticatedView extends StatelessWidget {
  const NotAuthenticatedView(
      {super.key,
      required this.description,
      required this.title,
      required this.heading});
  final String description, title, heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(text: title, size: 30),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            MyText(text: heading, size: 16),
            const SizedBox(
              height: 5,
            ),
            MyText(text: description, size: 14),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                label: 'Login',
                function: () {
                  Navigator.pushNamed(context, '/pop_login');
                })
          ],
        ),
      ),
    );
  }
}
