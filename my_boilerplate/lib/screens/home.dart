import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_boilerplate/screens/bottom_nav_screens/explore.dart';
import 'package:my_boilerplate/screens/bottom_nav_screens/inbox.dart';
import 'package:my_boilerplate/screens/bottom_nav_screens/login_profile.dart';
import 'package:my_boilerplate/screens/bottom_nav_screens/tips.dart';
import 'package:my_boilerplate/screens/bottom_nav_screens/wishlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItem = 0;
  int cancelCount = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Explore(),
      const WishList(),
      const Tips(),
      const Inbox(),
      const LoginProfile()
    ];
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          setState(() {
            selectedItem = 0;
          });
          final shouldpop = selectedItem == 0;
          if (selectedItem == 0) {
            cancelCount++;
          }
          return cancelCount == 2;
        },
        child: Scaffold(
          body: pages.elementAt(selectedItem),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedItem,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  selectedItem = index;
                  cancelCount = 0;
                });
              },
              showUnselectedLabels: true,
              unselectedItemColor: Colors.black54,
              selectedItemColor: Colors.red,
              unselectedFontSize: 10,
              selectedFontSize: 10,
              items: <BottomNavigationBarItem>[
                BottomNavItem(const Icon(Ionicons.search_outline), 'Explore'),
                BottomNavItem(const Icon(Ionicons.heart_outline), 'Wishlist'),
                BottomNavItem(const Icon(Ionicons.bus_outline), 'Bus'),
                BottomNavItem(const Icon(Ionicons.chatbox_outline), 'Inbox'),
                BottomNavItem(const Icon(Ionicons.person_circle_outline),
                    widget.token.isNotEmpty ? 'Profile' : 'Login'),
              ]),
        ),
      ),
    );
  }

  BottomNavigationBarItem BottomNavItem(Icon icon, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: icon,
        ),
        label: label);
  }
}
