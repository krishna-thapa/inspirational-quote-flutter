import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_provider.dart';

class LoginForm extends StatefulHookWidget {
  final String label;
  final IconData icon;

  // obscureText true for password only
  final bool isPasswordField;

  const LoginForm(this.label, this.icon, this.isPasswordField);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = useProvider(loginNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (formValue) {
            if (formValue.isEmpty) {
              return 'Please enter your ${widget.label}';
            }
            if (!widget.isPasswordField &&
                !EmailValidator.validate(formValue)) {
              return 'Invalid email format';
            } else if (widget.isPasswordField && formValue.length < 4) {
              return 'Invalid text length';
            }
            return null;
          },
          //autovalidate: true,
          onSaved: (formValue) {
            widget.isPasswordField
                ? loginProvider.setUserPassword(formValue.trim())
                : loginProvider.setUserEmail(formValue.trim().toLowerCase());
            debugPrint("Debug: $formValue");
          },
          obscureText: widget.isPasswordField,
          decoration: InputDecoration(
            hintText: widget.label,
            prefixIcon: Icon(widget.icon),
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
}
