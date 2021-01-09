import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/shared/quote-text.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';

class QuotePage extends StatefulWidget {
  final QuoteViewModel quote;

  const QuotePage(this.quote);

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: widget.quote.loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Center(
                    child: FadeAnimation(
                      0.2,
                        QuoteInText(
                          quote: widget.quote.quote,
                          isQuoteOfDay: false,
                        )
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
