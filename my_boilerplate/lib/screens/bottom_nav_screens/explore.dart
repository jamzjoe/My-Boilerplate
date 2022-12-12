import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/bloc/places/places_bloc.dart';
import 'package:my_boilerplate/components/searchCard.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/beach.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/bed.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/camping.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/houseboats.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/pools.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/private_rooms.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/tiny_homes.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/tropical.dart';
import 'package:my_boilerplate/screens/explore_screens.dart/views.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlacesBloc>(context).add(LoadPlaces());
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginSuccessful) {
        return const MyTab();
      } else {
        return const MyTab();
      }
    });
  }
}

class MyTab extends StatelessWidget {
  const MyTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchCard(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TabBar(
                physics: ScrollPhysics(),
                dragStartBehavior: DragStartBehavior.start,
                indicatorColor: Colors.black,
                labelColor: Colors.black54,
                isScrollable: true,
                automaticIndicatorColorAdjustment: true,
                tabs: [
                  Tab(
                    text: 'Beachfront',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/beach.png')),
                  ),
                  Tab(
                    text: 'Amazing views',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/views.png')),
                  ),
                  Tab(
                    text: 'Tiny homes',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/tiny.png')),
                  ),
                  Tab(
                    text: 'Bed and Breakfast',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/breakfast.png')),
                  ),
                  Tab(
                    text: 'Houseboats',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/houseboats.png')),
                  ),
                  Tab(
                    text: 'Private rooms',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/private.png')),
                  ),
                  Tab(
                    text: 'Amazing pools',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/pool.png')),
                  ),
                  Tab(
                    text: 'Tropical',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/tropical.png')),
                  ),
                  Tab(
                    text: 'Camping',
                    icon: Image(
                        width: 35,
                        height: 35,
                        image: AssetImage('assets/camping.png')),
                  ),
                ]),
          ),
          Expanded(
              child: TabBarView(children: [
            Beach(),
            Views(),
            TinyHome(),
            Bed(),
            HouseBoats(),
            PrivateRooms(),
            Pools(),
            Tropical(),
            Camping()
          ]))
        ],
      ),
    );
  }
}
