import 'package:dio/dio.dart';

import 'api_error_response.dart';

class QuoteException implements Exception {
  QuoteException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        message = _handleError(dioError.response);
        break;
      case DioErrorType.CANCEL:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.DEFAULT:
        message = "Connection to API server failed due to internet connection";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String message;

  String _handleError(Response response) {
    final errorMsgResponse = ApiErrorResponse.fromJson(response.data);
    switch (response.statusCode) {
      case 400:
        return "Bad request: ${errorMsgResponse.userMsg}";
      case 401:
        return "Unauthorized: ${errorMsgResponse.userMsg}";
      case 404:
        return "Not found: ${errorMsgResponse.userMsg}";
      case 422:
        return "Unprocessable Entity: ${errorMsgResponse.userMsg}";
      case 500:
        return "Internal server error";
      default:
        return "Something went wrong";
    }
  }

  @override
    String toString() => message;
}