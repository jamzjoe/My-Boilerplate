import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_boilerplate/components/myText.dart';
import 'package:my_boilerplate/components/profileTile.dart';

class SampleView extends StatelessWidget {
  const SampleView(
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
            ProfileTile(
                imageURL:
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                name: title,
                icon: Ionicons.arrow_forward_circle_outline),
          ],
        ),
      ),
    );
  }
}
