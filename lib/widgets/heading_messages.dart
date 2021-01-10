import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';

class HeadingMessages extends StatefulWidget {
  final String heading1;
  final String heading2;
  const HeadingMessages(this.heading1, this.heading2);

  @override
  _HeadingMessagesState createState() => _HeadingMessagesState();
}

class _HeadingMessagesState extends State<HeadingMessages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FadeAnimation(0.4, Text(widget.heading1, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),)),
        SizedBox(height: 20,),
        FadeAnimation(0.4, Text(widget.heading2,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15
          ),))
      ],
    );
  }
}