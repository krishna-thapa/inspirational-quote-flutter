import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';

FadeAnimation subHeadingLogin(heading1, heading2, delay) {
  return FadeAnimation(
      delay,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(heading1),
          Text(
            heading2,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ],
      ));
}
