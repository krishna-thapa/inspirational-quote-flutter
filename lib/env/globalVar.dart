import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final globalVarNotifierProvider =
    ChangeNotifierProvider<GlobalVar>((ref) => GlobalVar());

class GlobalVar extends ChangeNotifier {
  int currentIndex = 0;

  void selectedPage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
