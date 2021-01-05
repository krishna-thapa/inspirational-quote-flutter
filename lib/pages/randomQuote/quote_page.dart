import 'package:flutter/material.dart';
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
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Image.asset(
                          'assets/images/quote_symbol.png',
                          alignment: Alignment.centerLeft,
                          height: 60,
                          width: 60,
                          color: Colors.black,
                        ),
                        Text(
                          widget.quote.quote.quote,
                          style: TextStyle(
                              fontSize: 30.0, fontFamily: 'quoteScript'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          widget.quote.quote.author,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'quoteScript'),
                        ),
                        Text(
                          "#${widget.quote.quote.genre}",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: 'quoteScript'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
