import 'package:flutter/material.dart';
import 'package:my_boilerplate/components/myText.dart';

class AdsTile extends StatelessWidget {
  const AdsTile({super.key, required this.name, required this.icon});
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
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
      ],
    ));
  }
}
