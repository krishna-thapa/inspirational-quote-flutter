import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:inspirational_quote_flutter/exception/quote_exception.dart';
import 'package:inspirational_quote_flutter/pages/quote/quote_of_the_day.dart';
import 'package:inspirational_quote_flutter/services/quote_apiservice.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final randomQuoteFutureProvider =
//     FutureProvider.autoDispose<Quote>((ref) async {
//   ref.maintainState = true;

//   final quoteService = ref.watch(quoteServiceProvider);
//   final randomQuote = await quoteService.getRandomQuote();
//   return randomQuote;
// });

class QuoteRepository extends HookWidget {
  const QuoteRepository({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuoteViewModel quoteVm = useProvider(quoteProvider);
    return SafeArea(
        child: Column(
      children: [
        Expanded(child: SingleChildScrollView(child: QuoteOfTheDayPage(quoteVm))),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    quoteVm.getQuote();
                  },
                  child: Icon(Icons.refresh, size: 35, color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    // Add your onPressed code here!
                  },
                  child: Icon(Icons.content_copy, size: 30, color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    // Add your onPressed code here!
                  },
                  child: Icon(Icons.share, size: 30, color: Colors.black),
                )
              ]),
        )
      ],
    ));
  }
}

// class _ErrorBody extends StatelessWidget {
//   const _ErrorBody({
//     Key key,
//     @required this.message,
//   })  : assert(message != null, 'A non-null String must be provided'),
//         super(key: key);

//   final String message;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(message),
//           RaisedButton(
//             onPressed: () => context.refresh(randomQuoteFutureProvider),
//             child: Text("Try again"),
//           ),
//         ],
//       ),
//     );
//   }
// }
