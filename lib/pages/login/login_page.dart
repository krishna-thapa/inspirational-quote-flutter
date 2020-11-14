import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/login_button.dart';
import 'package:inspirational_quote_flutter/widgets/signup_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.green, Colors.tealAccent]
          )
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                FadeAnimation(1, Text("Welcome", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),)),
                SizedBox(height: 20,),
                FadeAnimation(1.2, Text("Login to see the Wonderland",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15
                ),))
              ],
            ),
            FadeAnimation(1.4, Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome.png')
                )
              ),
            )),
            Column(
              children: <Widget>[
                LoginButton(),
                SizedBox(height: 20,),
                SignupButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}