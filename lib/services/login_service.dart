import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:inspirational_quote_flutter/exception/quote_exception.dart';
import 'package:inspirational_quote_flutter/models/login_model.dart';

import 'base_service.dart';

class LoginService extends BaseService {

  final LoginModel loginDetails = new LoginModel(
    email: "admin@com",
    password: "admin"
  );

  /*
    Get the token key once the user is successfully logged in
   */
  Future<String> loginInUser() async {
    final url = 'auth/signIn';
    try {
      final Response response = await dio.post(url, data: jsonEncode(loginDetails));
      // Get the jwt token from the header and remove
      return response.statusMessage; //headers.value('jwt-token').split(' ')[1].trim();
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }
}