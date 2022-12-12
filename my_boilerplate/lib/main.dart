import 'package:flutter/material.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/bloc/places/places_bloc.dart';
import 'package:my_boilerplate/routes/router.dart';
import 'package:my_boilerplate/screens/unknown_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(ReadingTokenEvent()),
        ),
        BlocProvider<PlacesBloc>(
            create: (context) => PlacesBloc()..add(LoadPlaces()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: routes,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => const UnknownPage(),
          );
        },
      ),
    );
  }
}
