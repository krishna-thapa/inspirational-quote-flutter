import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/login/login_provider.dart';
import 'package:inspirational_quote_flutter/view_models/login_vm.dart';

class ColoredButton extends StatefulHookWidget {
  final String label;
  final GlobalKey<FormState> formKey;

  const ColoredButton({this.label, this.formKey});

  @override
  _ColoredButtonState createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = useProvider(loginNotifierProvider);
    final LoginViewModel loginUser = useProvider(loginUserProvider);
    return FadeAnimation(
        0.2,
        Container(
          padding: EdgeInsets.only(top: 3, left: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border(
                bottom: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
              )),
          child: MaterialButton(
            minWidth: double.infinity,
            height: 60,
            onPressed: () {
              // Validate returns true if the form is valid, or false
              if (widget.formKey.currentState.validate()) {
                widget.formKey.currentState.save();
                loginUser.error
                    ? Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('${loginUser.errorMsg}')))
                    : Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Success: ${loginUser.quote}')));
                debugPrint(
                    "Result Json: ${jsonEncode(loginProvider.loginModel)}");
              }
            },
            color: Colors.teal,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Text(widget.label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
        ));
  }
}
