import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.function});
  final String label;
  final IconData icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(flex: 1, child: Icon(icon)),
                Flexible(flex: 1, child: Text(label)),
                const Flexible(flex: 0, child: SizedBox())
              ],
            ),
          ),
        )
        // child: ElevatedButton.icon(
        //     icon: Icon(icon),
        //     onPressed: () {
        //       function;
        //     },
        //     label: Text(label)),
        );
  }
}
