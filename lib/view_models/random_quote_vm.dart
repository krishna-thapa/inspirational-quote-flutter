import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/repository/quotes_repository.dart';

import 'quote_base_model.dart';

final randomQuoteProvider = ChangeNotifierProvider<QuoteViewModel>((ref) {
  return QuoteViewModel();
});

class QuoteViewModel extends QuoteBaseModel<Quote> {
  QuoteViewModel() {
    getRandomQuoteVM();
  }

  QuotesRepository quotesRepository = new QuotesRepository();

  Future<void> getRandomQuoteVM() async {
    setLoadingAsTrue();
    try {
      final Quote res = await quotesRepository.getRandomQuote();
      setReturnState(res);
    } catch (e) {
      setErrorState(e.toString());
    }
  }
}
