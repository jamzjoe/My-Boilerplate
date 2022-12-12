import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/components/loading.dart';
import 'package:my_boilerplate/screens/home.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          print(state);
          if (state is DefaultHome) {
            return const Home(token: '');
          } else if (state is LoadingData) {
            return const Loading();
          }
          return const Home(token: '');
        },
        listener: (context, state) {
          if (state is LogoutFailed) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 1),
            ));
          } else if (state is LoginSuccessful) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Login Successfully'),
                backgroundColor: Colors.pinkAccent,
                duration: Duration(seconds: 1)));
          } else if (state is LoginFailed) {
            Navigator.pushNamed(context, '/pop_login');
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 1)));
          } else if (state is LogoutSuccessful) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.pinkAccent,
                duration: const Duration(seconds: 1)));
          } else if (state is WelcomeBackUser) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Horray! Welcome back ${state.name}'),
                backgroundColor: Colors.pinkAccent,
                duration: const Duration(seconds: 1)));
          } else if (state is ReadingTokenError) {
            Navigator.pushNamed(context, '/pop_login');
          }
        },
      ),
    );
  }
}
