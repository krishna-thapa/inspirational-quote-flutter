import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inspirational_quote_flutter/models/all_quotes_of_day.dart';
import 'package:inspirational_quote_flutter/repository/quotes_repository.dart';

final quotesOfDayProvider = ChangeNotifierProvider<QuotesOfDayViewModel>((ref) {
  return QuotesOfDayViewModel();
});

class QuotesOfDayViewModel extends ChangeNotifier {
  QuotesOfDayViewModel() {
    getAllQuotesOfDayVM();
  }

  QuotesRepository quotesRepository = new QuotesRepository();
  bool loading = false;
  bool error = false;
  String errorMsg = "Something went wrong!";
  List<AllQuotesOfDay> quote;

  Future<void> getAllQuotesOfDayVM() async {
    loading = true;
    notifyListeners();
    try {
      final List<AllQuotesOfDay> res =
          await quotesRepository.getAllQuotesOfDay();
      error = false;
      // Sorting the list with content date in descending order
      // TODO test this what if res is null
      if (res.length > 1)
        res.sort((a, b) {
          var aDate = a.contentDate;
          var bDate = b.contentDate;
          return -aDate.compareTo(bDate);
        });
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
