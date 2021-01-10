import 'package:inspirational_quote_flutter/models/all_quotes_of_day.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/services/quote_apiservice.dart';

class QuotesRepository {
  QuoteService quoteService = QuoteService();

  Future<Quote> getRandomQuote() async {
    return await quoteService.getRandomQuote();
  }

  Future<Quote> getQuoteOfTheDay() async {
    return await quoteService.getQuoteOfTheDay();
  }

  Future<List<AllQuotesOfDay>> getAllQuotesOfDay() async {
    return await quoteService.getAllQuotesOfDay();
  }
}
