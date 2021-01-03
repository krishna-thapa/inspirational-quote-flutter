import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:inspirational_quote_flutter/exception/quote_exception.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

class QuoteService {
  Dio _dio;

  QuoteService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: "http://localhost:9000/quote");
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
  }

  /*
    Get the random quote from the database
   */
  Future<Quote> getRandomQuote() async {
    final url = '/random';
    try {
      final response = await _dio.get(url);
      Quote result = Quote.fromJson(response.data);
      return result;
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }

  /*
    Get the quote of the day from the database
   */
  Future<Quote> getQuoteOfTheDay() async {
    final url = '/quoteOfTheDay';
    try {
      final response = await _dio.get(url);
      Quote result = Quote.fromJson(response.data);
      return result;
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }

  /*
    Get ten random quotes from the database
   */
  Future<List<Quote>> getTenRandomQuotes() async {
    final url = '/randomTen';
    try {
      final response = await _dio.get(url);
      List<Quote> result = quotesModelFromJson(response.data);
      return result;
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }
}
