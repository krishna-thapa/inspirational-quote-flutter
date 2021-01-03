import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/quote/quote_of_the_day.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuoteRepository extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final QuoteViewModel quoteVm = useProvider(quoteProvider);
    return SafeArea(
        child:quoteVm.error
      ? _ErrorBody(message: quoteVm.errorMSg)
      : Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Expanded(child: FadeAnimation(1.3, QuoteOfTheDayPage(quoteVm))),
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
                  child:
                      Icon(Icons.content_copy, size: 30, color: Colors.black),
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
             onPressed: () {},
             child: Text("Try again"),
           ),
         ],
       ),
     );
   }
 }
