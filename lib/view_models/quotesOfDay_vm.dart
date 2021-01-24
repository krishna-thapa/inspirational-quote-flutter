import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inspirational_quote_flutter/models/all_quotes_of_day.dart';
import 'package:inspirational_quote_flutter/repository/quotes_repository.dart';
import 'package:inspirational_quote_flutter/view_models/quote_base_model.dart';

final quotesOfDayProvider = ChangeNotifierProvider<QuotesOfDayViewModel>((ref) {
  return QuotesOfDayViewModel();
});

class QuotesOfDayViewModel extends QuoteBaseModel<List<AllQuotesOfDay>> {
  QuotesOfDayViewModel() {
    getAllQuotesOfDayVM();
  }

  QuotesRepository quotesRepository = new QuotesRepository();

  Future<void> getAllQuotesOfDayVM() async {
    setLoadingAsTrue();
    try {
      final List<AllQuotesOfDay> res = await quotesRepository.getAllQuotesOfDay();
      // Sorting the list with content date in descending order
      if (res.length > 1) {
        res.sort((a, b) {
          var aDate = a.contentDate;
          var bDate = b.contentDate;
          return aDate.compareTo(bDate);
        });
        // Rearranging the order for the Swiper widget
        res.insert(0, res.last);
        res.removeLast();
      }
      setReturnState(res);
    } catch (e) {
      setErrorState(e.toString());
    }
  }
}
