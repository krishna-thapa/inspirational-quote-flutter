import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inspirational_quote_flutter/view_models/quotesOfDay_vm.dart';
import 'package:inspirational_quote_flutter/view_models/random_quote_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorBody extends HookWidget {
  final QuoteViewModel randomQuote = useProvider(randomQuoteProvider);
  final QuotesOfDayViewModel quotesOfDay = useProvider(quotesOfDayProvider);

  ErrorBody({
    Key key,
    @required this.isQuoteOfDay,
    @required this.message,
  })
      : assert(message != null, 'A non-null String must be provided'),
        super(key: key);

  final String message;
  final bool isQuoteOfDay;

  //TODO : Make use of Login button
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              )),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(top: 3, left: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                )),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () =>
              isQuoteOfDay
                  ? quotesOfDay.getAllQuotesOfDayVM()
                  : randomQuote.getRandomQuoteVM(),
              color: Colors.teal,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text("Try again",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
