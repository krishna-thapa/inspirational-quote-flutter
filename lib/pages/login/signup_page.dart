import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/widgets/appbar_login.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';
import 'package:inspirational_quote_flutter/widgets/heading_messages.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarLogin(),
      body: SingleChildScrollView(
        child: Container(
          decoration: baseBackgroundDecoration,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeadingMessages("Sign up", "Create a new account"),
            ],
          ),
        ),
      ),
    );
  }
}