import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/components/notAuthenticatedView.dart';
import 'package:my_boilerplate/components/sample_view.dart';

class Tips extends StatefulWidget {
  const Tips({super.key});

  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginSuccessful) {
        return const Center(
            child: SampleView(
                description:
                    'You can create, view, or edit wishlist once you have logged in',
                title: 'List of Tips must be there',
                heading: 'Tips'));
      } else {
        return const NotAuthenticatedView(
            title: 'Tips',
            description:
                'You can create, view, or edit wishlist once you have logged in',
            heading: "Login to view your wishlist");
      }
    });
  }
}
