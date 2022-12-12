import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_boilerplate/components/myText.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Ionicons.search_outline),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              MyText(text: 'Where to?', size: 15),
                              MyText(
                                  text: 'Anywhere? Any week? Add guest?',
                                  size: 12)
                            ],
                          ),
                        ],
                      ),
                      const Icon(Ionicons.options_outline),
                    ],
                  ),
                ),
              );
  }
}