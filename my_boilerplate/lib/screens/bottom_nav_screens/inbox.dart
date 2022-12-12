import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/components/notAuthenticatedView.dart';
import 'package:my_boilerplate/components/sample_view.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginSuccessful) {
        return const Center(
            child: SampleView(
                description:
                    'You can create, view, or edit wishlist once you have logged in',
                title: 'List of Inbox must be there',
                heading: 'Inbox'));
      } else {
        return const NotAuthenticatedView(
          title: 'Inbox',
          description:
              'You can create, view, or edit wishlist once you have logged in',
          heading: "Login to view your wishlist",
        );
      }
    });
  }
}
