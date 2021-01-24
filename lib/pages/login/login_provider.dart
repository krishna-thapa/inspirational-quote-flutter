import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import '../../models/login_model.dart';

final loginNotifierProvider =
    ChangeNotifierProvider<LoginProvider>((ref) => LoginProvider());

class LoginProvider extends ChangeNotifier {
  LoginModel loginModel = new LoginModel(email: "", password: "");

  void setUserEmail(String email) {
    loginModel.email = email;
    //notifyListeners();
  }

  // TODO: use these notifier to fill the text
  void setUserPassword(String password) {
    loginModel.password = password;
    //notifyListeners();
  }
}
