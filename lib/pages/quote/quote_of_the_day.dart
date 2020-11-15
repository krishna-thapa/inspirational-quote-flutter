import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/apiResponse/quote_Response.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

class QuoteOfTheDayPage extends StatefulWidget {
  @override
  _QuoteOfTheDayPageState createState() => _QuoteOfTheDayPageState();
}

class _QuoteOfTheDayPageState extends State<QuoteOfTheDayPage> {
  Future<Quote> quoteOfTheDay;

  @override
  void initState() {
    super.initState();
    quoteOfTheDay = fetchQuoteOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Quote>(
      future: quoteOfTheDay,
      builder: (context, response) {
        if (response.hasData) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 30.0, right: 10.0),
                    child: Text(
                      response.data.quote,
                      style: TextStyle(fontSize: 30.0, fontFamily: 'quoteScript'),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (response.hasError) {
          return Text("Response error: ${response.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
