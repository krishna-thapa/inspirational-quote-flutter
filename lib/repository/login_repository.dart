import 'package:inspirational_quote_flutter/services/login_service.dart';

class LoginRepository {
  LoginService loginService = LoginService();

  Future getLoginInUser() async {
    return await loginService.loginInUser();
  }
}