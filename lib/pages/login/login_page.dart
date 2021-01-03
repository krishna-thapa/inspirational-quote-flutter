import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/widgets/appbar_login.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';
import 'package:inspirational_quote_flutter/widgets/heading_messages.dart';
import 'package:inspirational_quote_flutter/widgets/colored_button.dart';
import 'package:inspirational_quote_flutter/widgets/login_form.dart';
import 'package:inspirational_quote_flutter/widgets/sub_heading_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = useProvider(themeColorNotifierProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      //backgroundColor: Colors.white,
      appBar: AppBarLogin(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: themeColor.baseBackgroundDecoration,
        child: ListView(
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
                        FadeAnimation(1.1, loginForm("Email", Icons.email)),
                        FadeAnimation(1.2,
                            loginForm("Password", Icons.lock_outline, true)),
                        SizedBox(
                          height: 5,
                        ),
                        ColoredButton("Login"),
                      ],
                    ),
                  ),
                  subHeadingLogin("Don't have an account?", "Sign up", 1.2),
                  SizedBox(
                    height: 5,
                  ),
                  FadeAnimation(
                      1.2,
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/today_is_your_day.png'),
                                fit: BoxFit.cover,
                                alignment: Alignment.center)),
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
