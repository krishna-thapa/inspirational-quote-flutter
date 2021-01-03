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
    getQuote();
  }

  QuotesRepository quotesRepository = new QuotesRepository();
  bool loading = false;
  bool error = false;
  String errorMSg = "Something went wronsdg";
  Quote quote;

  Future<void> getQuote() async {
    loading = true;
    notifyListeners();
    try {
      final res = await quotesRepository.getQuote();
      log("log outout ${res.author}");
      error = false;
      quote = res;
      loading = false;
      notifyListeners();
    } catch (e) {
      log("log error ${e.toString()}");
      error = true;
      errorMSg = e.toString();
      loading = false;
      notifyListeners();
    }
  }
}