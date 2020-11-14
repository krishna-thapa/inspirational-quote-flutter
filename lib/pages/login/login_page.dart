import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/heading_messages.dart';
import 'package:inspirational_quote_flutter/widgets/input_field.dart';
import 'package:inspirational_quote_flutter/widgets/colored_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.green, Colors.tealAccent]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  HeadingMessages("Login", "Login to your account"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        FadeAnimation(1.1, InputField("Email")),
                        FadeAnimation(1.2, InputField("Password", true)),
                        SizedBox(height: 5,),
                        ColoredButton("Login"),
                      ],
                    ),
                  ),
                  FadeAnimation(1.2, Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      Text("Sign up", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18
                      ),),
                    ],
                  )),
                  FadeAnimation(1.2, Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/today_is_your_day.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.center
                        )
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}