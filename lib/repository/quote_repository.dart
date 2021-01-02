import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:inspirational_quote_flutter/exception/quote_exception.dart';
import 'package:inspirational_quote_flutter/pages/quote/quote_of_the_day.dart';
import 'package:inspirational_quote_flutter/services/quote_apiservice.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

final randomQuoteFutureProvider =
    FutureProvider.autoDispose<Quote>((ref) async {
  ref.maintainState = true;

  final quoteService = ref.watch(quoteServiceProvider);
  final randomQuote = await quoteService.getRandomQuote();
  return randomQuote;
});

class QuoteRepository extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeArea(
        child: watch(randomQuoteFutureProvider).when(
      error: (e, s) {
        if (e is QuoteException) {
          return _ErrorBody(message: e.message);
        }
        return _ErrorBody(message: "Oops, something unexpected happened");
      },
      loading: () => Center(child: CircularProgressIndicator()),
      data: (quote) {
        return RefreshIndicator(
            onRefresh: () {
              return context.refresh(randomQuoteFutureProvider);
            },
            child: QuoteOfTheDayPage(quote)
            
            );
      },
    ));
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({
    Key key,
    @required this.message,
  })  : assert(message != null, 'A non-null String must be provided'),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          RaisedButton(
            onPressed: () => context.refresh(randomQuoteFutureProvider),
            child: Text("Try again"),
          ),
        ],
      ),
    );
  }
}
