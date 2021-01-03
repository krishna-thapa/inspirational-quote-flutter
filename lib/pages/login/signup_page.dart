import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/appbar_login.dart';
import 'package:inspirational_quote_flutter/widgets/colored_button.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';
import 'package:inspirational_quote_flutter/widgets/heading_messages.dart';
import 'package:inspirational_quote_flutter/widgets/input_field.dart';
import 'package:inspirational_quote_flutter/widgets/sub_heading_login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = useProvider(themeColorNotifierProvider);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBarLogin(),
        body: Container(
          decoration: themeColor.baseBackgroundDecoration,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: ListView(
            children: [
              HeadingMessages("Sign up", "Create a new account"),
              Column(
                children: [
                  FadeAnimation(1.2, InputField("First Name")),
                  FadeAnimation(1.2, InputField("Last Name")),
                  FadeAnimation(1.3, InputField("Email", true)),
                  FadeAnimation(1.3, InputField("Password", true)),
                  FadeAnimation(1.4, InputField("Confirm Password", true))
                ],
              ),
              ColoredButton("Sign up"),
              subHeadingLogin("Already have an account?", "Login", 1.2),
              SizedBox(height: 20),
            ],
          ),
        )
        //),
        );
  }
}
