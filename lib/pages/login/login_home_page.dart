import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';
import 'package:inspirational_quote_flutter/widgets/heading_messages.dart';
import 'package:inspirational_quote_flutter/widgets/login_button.dart';
import 'package:inspirational_quote_flutter/widgets/colored_button.dart';

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeadingMessages("Welcome", "Login to see the Wonderland"),
            FadeAnimation(1.3, Container(
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