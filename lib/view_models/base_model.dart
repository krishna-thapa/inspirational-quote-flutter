import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoadingAsFalse() {
    _loading = false;
    notifyListeners();
  }

  void setLoadingAsTrue() {
    _loading = true;
    notifyListeners();
  }
}