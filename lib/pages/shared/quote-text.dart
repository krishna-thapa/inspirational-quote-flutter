import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

class QuoteInText extends HookWidget {
  const QuoteInText({this.isQuoteOfDay, this.quote});

  final bool isQuoteOfDay;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Image.asset(
          'assets/images/quote_symbol.png',
          alignment: Alignment.topLeft,
          height: 60,
          width: 60,
          color: Colors.black,
        ),
        quote.quote != null
            ? Text(
                quote.quote,
                style: TextStyle(fontSize: 30.0, fontFamily: 'quoteScript'),
                softWrap: true,
              )
            : Text(
                quote.quote,
                style: TextStyle(fontSize: 30.0, fontFamily: 'quoteScript'),
                softWrap: true,
              ),
        SizedBox(
          height: 10,
        ),
        if (quote.author != null)
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: FaIcon(
                    FontAwesomeIcons.at,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: " ${quote.author}",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'quoteScript',
                      color: Colors.black),
                )
              ],
            ),
          ),
        SizedBox(
          height: 10,
        ),
        if (quote.genre != null)
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: FaIcon(
                    FontAwesomeIcons.hashtag,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: " ${quote.genre}",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'quoteScript',
                      color: Colors.black),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
