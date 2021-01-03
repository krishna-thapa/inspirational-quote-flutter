import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/repository/quotes_repository.dart';

final quoteProvider = ChangeNotifierProvider<QuoteViewModel>((ref) {
  return QuoteViewModel();
});

class QuoteViewModel extends ChangeNotifier {
  QuoteViewModel() {
    getRandomQuote();
  }

  QuotesRepository quotesRepository = new QuotesRepository();
  bool loading = false;
  bool error = false;
  String errorMsg = "Something went wrong!";
  Quote quote;

  Future<void> getRandomQuote() async {
    loading = true;
    notifyListeners();
    try {
      final res = await quotesRepository.getQuote();
      error = false;
      quote = res;
      loading = false;
      notifyListeners();
    } catch (e) {
      log("log error while getting random quote: ${e.toString()}");
      error = true;
      errorMsg = e.toString();
      loading = false;
      notifyListeners();
    }
  }
}
