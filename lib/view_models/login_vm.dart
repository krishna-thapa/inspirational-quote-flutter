import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inspirational_quote_flutter/repository/login_repository.dart';
import 'package:inspirational_quote_flutter/view_models/quote_base_model.dart';

final loginUserProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  return LoginViewModel();
});

class LoginViewModel extends QuoteBaseModel {

  LoginViewModel() {
    loginUserVM();
  }
  LoginRepository loginRepository = new LoginRepository();

  Future<void> loginUserVM() async {
    setLoadingAsTrue();
    try {
      final res = await loginRepository.getLoginInUser();
      log("Result: ${res.toString()}");
      setReturnState(res);
    } catch (e) {
      log("Error: ${e.toString()}");
      setErrorState(e.toString());
    }
  }
}