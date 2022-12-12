import 'package:flutter/src/widgets/framework.dart';
import 'package:my_boilerplate/screens/auth_wrapper.dart';
import 'package:my_boilerplate/screens/home.dart';
import 'package:my_boilerplate/screens/login.dart';
import 'package:my_boilerplate/screens/login_pop_up.dart';

Map<String, StatefulWidget Function(dynamic context)> routes = {
  '/': (context) => const AuthWrapper(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const Home(
        token: '',
      ),
  '/pop_login': (context) => const PopUpLogin(),
  '/auth_wrapper': (context) => const AuthWrapper()
};
