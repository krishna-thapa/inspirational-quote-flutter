import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';
import 'package:inspirational_quote_flutter/widgets/heading_messages.dart';
import 'package:inspirational_quote_flutter/widgets/login_button.dart';
import 'package:inspirational_quote_flutter/widgets/colored_button.dart';

class LoginHomePage extends StatefulHookWidget {
  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = useProvider(themeColorNotifierProvider);
    return Scaffold(
      body: Container(
        decoration: themeColor.baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeadingMessages("Welcome", "Login to see the Wonderland"),
            FadeAnimation(0.4, Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/good_vibe.png')
                )
              ),
            )),
            Column(
              children: <Widget>[
                LoginButton(),
                SizedBox(height: 20,),
                ColoredButton("Sign up")
              ],
            )
          ],
        ),
      ),
    );
  }
}