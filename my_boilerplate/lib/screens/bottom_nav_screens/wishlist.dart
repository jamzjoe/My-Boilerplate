import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/components/notAuthenticatedView.dart';
import 'package:my_boilerplate/components/sample_view.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginSuccessful) {
         return const Center(
            child: SampleView(
                description:
                    'You can create, view, or edit wishlist once you have logged in',
                title: 'List of Wishlist must be there',
                heading: 'Wishlist'));
      } else {
        return const NotAuthenticatedView(
            title: 'WishList',
            description:
                'You can create, view, or edit wishlist once you have logged in',
            heading: "Login to view your wishlist");
      }
    });
  }
}
