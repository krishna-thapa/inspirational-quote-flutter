import 'package:dio/dio.dart';
import 'package:inspirational_quote_flutter/models/all_quotes_of_day.dart';
import 'package:inspirational_quote_flutter/exception/quote_exception.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

import 'base_service.dart';

class QuoteService extends BaseService {

  /*
    Get the random quote from the database
   */
  Future<Quote> getRandomQuote() async {
    final url = 'quote/random';
    try {
      final response = await dio.get(url);
      return Quote.fromJson(response.data);
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }

  /*
    Get all Redis stored quote of the day
    Maximum would be last 5 quotes of the day
   */
  Future<List<AllQuotesOfDay>> getAllQuotesOfDay() async {
    final url = 'quote/quotesOfTheDay';
    try {
      final response = await dio.get(url);
      return allQuotesModelFromJson(response.data);
    } on DioError catch (dioError) {
      throw QuoteException.fromDioError(dioError);
    }
  }
}
