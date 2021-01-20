import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';
import 'package:inspirational_quote_flutter/widgets/colored_button.dart';
import 'package:inspirational_quote_flutter/pages/login/login_form.dart';
import 'package:inspirational_quote_flutter/widgets/sub_heading_login.dart';

class LoginPage extends StatefulHookWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeColor = useProvider(themeColorNotifierProvider);
    return Form(
      key: _formLoginKey,
      child: Container(
        decoration: themeColor.baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //HeadingMessages("Welcome", "Login to your account"),
                  FadeAnimation(
                      0.4,
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/good_vibe.png'))),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        FadeAnimation(0.2, loginForm("Email", Icons.email)),
                        FadeAnimation(0.2,
                            loginForm("Password", Icons.lock_outline, true)),
                        SizedBox(
                          height: 5,
                        ),
                        ColoredButton(label: "Login", formKey: _formLoginKey),
                      ],
                    ),
                  ),
                  subHeadingLogin(context, true),
                  SizedBox(
                    height: 5,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
