import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final bool obscureText;

  InputField(this.label, [this.obscureText = false]);

  @override
  _InputFieldState createState() => _InputFieldState();
}

// Might have to merge some common methods with login_form file
class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        )),
        SizedBox(height: 5),
        TextField(
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
            )
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}