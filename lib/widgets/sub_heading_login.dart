import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/login/login_page.dart';
import 'package:inspirational_quote_flutter/pages/login/signup_page.dart';

import 'animate_button.dart';

FadeAnimation subHeadingLogin(BuildContext context, bool isLogin) {
  return FadeAnimation(
      0.2,
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLogin
                ? Text('Don\'t have an account?')
                : Text('Already have an account?'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: AnimateButton(
                iconSize: 30,
                animationTime: Duration(milliseconds: 100),
                iconStartColor: Colors.black,
                iconToAdd:
                    isLogin ? FontAwesomeIcons.userPlus : FontAwesomeIcons.solidUser,
                valueChanged: (_isFavorite) {
                  isLogin
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignupPage()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                },
              ),
            ),
          ],
        ),
      ));
}
