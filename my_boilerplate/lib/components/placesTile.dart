import 'package:flutter/cupertino.dart';
import 'package:my_boilerplate/components/myText.dart';
import 'package:my_boilerplate/models/places.dart';

class PlacesTiles extends StatelessWidget {
  const PlacesTiles({super.key, required this.e});
  final Places e;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image(image: NetworkImage(e.imageUrl.toString())),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(text: e.name.toString(), size: 16),
                MyText(text: "${e.rate} ratings", size: 14)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(text: '${e.kilometers}', size: 14),
            MyText(text: '${e.date}', size: 14),
            const SizedBox(
              height: 10,
            ),
            MyText(text: '₱${e.price} per night', size: 14)
          ],
        ),
      ),
    );
  }
}
