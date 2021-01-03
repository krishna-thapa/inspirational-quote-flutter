import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/services/quote_apiservice.dart';

class QuotesRepository {
  QuoteService quoteService = QuoteService();

  Future<Quote> getQuote() async {
    final quote = await quoteService.getRandomQuote();
    return quote;
  }
}
