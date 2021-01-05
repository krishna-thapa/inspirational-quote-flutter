import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final themeColorNotifierProvider =
ChangeNotifierProvider<ThemeColor>((ref) => ThemeColor());

class ThemeColor extends ChangeNotifier {

  BoxDecoration baseBackgroundDecoration =
  BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.green, Colors.tealAccent]
      )
  );

  Color black = Colors.black;
  Color white = Colors.white54;

  Color navigationBarBackground = Color(0xFF20B733);

}