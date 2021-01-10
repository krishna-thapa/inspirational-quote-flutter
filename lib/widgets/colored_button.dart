import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/login/signup_page.dart';

class ColoredButton extends StatefulWidget {
  final String label;

  const ColoredButton(this.label);

  @override
  _ColoredButtonState createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(0.2, Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border(
            bottom: BorderSide(color: Colors.black),
            top: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
          )
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => SignupPage())
          );
        },
        color: Colors.teal,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        child: Text(widget.label, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
        )),
      ),
    ));
  }
}
