import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inspirational_quote_flutter/exception/quote_exception.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

final quoteServiceProvider = Provider<QuoteService>((ref) {
  //final config = ref.watch(environmentConfigProvider);
  return QuoteService(Dio());
});

class QuoteService {
  QuoteService(this._dio);

  final Dio _dio;

  Future<Quote> getRandomQuote() async {
    try {
      final response = await _dio.get("http://localhost:9000/quote/quoteOfTheDay");
      final result = Quote.fromJson(response.data);
      return result;
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }
}
