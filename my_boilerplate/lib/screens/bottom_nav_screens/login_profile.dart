import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/components/adsTile.dart';
import 'package:my_boilerplate/components/myButton.dart';
import 'package:my_boilerplate/components/myText.dart';
import 'package:my_boilerplate/components/profileTile.dart';

class LoginProfile extends StatefulWidget {
  const LoginProfile({super.key});

  @override
  State<LoginProfile> createState() => _LoginProfileState();
}

class _LoginProfileState extends State<LoginProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LogoutSuccessful ||
            state is LoginFailed ||
            state is DefaultHome) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MyText(text: 'Your Profile', size: 30),
                const SizedBox(
                  height: 10,
                ),
                const MyText(
                    text: 'Log in to start your planning your next trip.',
                    size: 14),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    label: 'Log in',
                    function: () {
                      Navigator.pushNamed(context, '/pop_login');
                    }),
                const SizedBox(
                  height: 10,
                ),
                const MyText(text: "Don't have an account? Sign up", size: 12),
              ],
            ),
          );
        }
        if (state is LoginSuccessful) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(text: 'Profile', size: 25),
                    const SizedBox(
                      height: 20,
                    ),
                    ProfileTile(
                        imageURL:
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        name: state.users.name.toString(),
                        icon: Ionicons.arrow_forward_circle_outline),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const AdsTile(
                        name: 'Earn money from your extra space',
                        icon: Ionicons.gift_outline),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                        label: 'Logout',
                        function: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(LogoutEvent(state.token));
                        }),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
