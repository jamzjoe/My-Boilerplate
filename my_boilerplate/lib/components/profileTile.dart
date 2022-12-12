import 'package:flutter/material.dart';
import 'package:my_boilerplate/components/myText.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.icon});
  final String imageURL;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageURL),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: name, size: 18),
                const MyText(text: 'Show Profile', size: 12)
              ],
            )
          ],
        ),
        Icon(icon)
      ],
    );
  }
}
