import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// obscureText true for password only
Widget loginForm([label, icon, obscureText = false]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        validator: (formValue) {
          if (formValue.isEmpty) {
            return 'Please enter your $label';
          }
          if (!obscureText && !EmailValidator.validate(formValue)) {
            return 'Invalid email format';
          }
          else if (obscureText && formValue.length < 4) {
            return 'Invalid text length';
          }
          return null;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
