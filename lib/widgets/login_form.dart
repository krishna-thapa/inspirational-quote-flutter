import 'package:flutter/material.dart';

Widget loginForm([label, icon, obscureText = false]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
        ),
      ),
      SizedBox(height: 30,),
    ],
  );
}