import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_boilerplate/bloc/auth/auth_bloc.dart';
import 'package:my_boilerplate/components/myButton.dart';
import 'package:my_boilerplate/components/myText.dart';
import 'package:my_boilerplate/components/social_media_button.dart';

class PopUpLogin extends StatefulWidget {
  const PopUpLogin({Key? key}) : super(key: key);

  @override
  State<PopUpLogin> createState() => _PopUpLoginState();
}

final _passwordController = TextEditingController();
final _emailController = TextEditingController();
bool isLogin = false;

class _PopUpLoginState extends State<PopUpLogin> {
  @override
  Widget build(BuildContext _) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<AuthBloc>(context).add(DefaultHomeEvent());
              },
              icon: const Icon(
                Ionicons.close_outline,
                color: Colors.black54,
              )),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(text: "Login or sign up Joe's BNB", size: 24),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black54)),
                  child: Column(
                    children: [
                      TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              hintText: 'Email address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.black54)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black54)))),
                      TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Ionicons.checkmark_done,
                                color: Colors.black54,
                              ),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black54)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black54)))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MyText(
                    text:
                        "We'll call or text you to confirm your number. Standard message and data rates apply.",
                    size: 12),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                    label: 'Log in',
                    function: () async {
                      try {
                        BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            _emailController.text.trim().toString(),
                            _passwordController.text.trim().toString()));
                        Navigator.pop(context);
                      } catch (e) {
                        print(e.toString());
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: MyText(text: 'or', size: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                SocialMediaButton(
                    label: 'Continue with Email',
                    icon: Ionicons.mail_open_outline,
                    function: () {}),
                SocialMediaButton(
                    label: 'Continue with Facebook',
                    icon: Ionicons.logo_facebook,
                    function: () {}),
                SocialMediaButton(
                    label: 'Continue with Google',
                    icon: Ionicons.logo_google,
                    function: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
