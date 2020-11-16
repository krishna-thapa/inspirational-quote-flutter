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
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Spacer(flex: 2,),
                  Image.asset(
                      'assets/images/quote_symbol.png',
                    height: 60,
                    width: 60,
                    color: Colors.black,
                  ),
                  SizedBox(height: 20,),
                  Text(response.data.quote,
                    style: TextStyle(fontSize: 30.0, fontFamily: 'quoteScript'),
                  ),
                  SizedBox(height: 30,),
                  Text(response.data.author,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'quoteScript'),
                  ),
                  Text("#${response.data.genre}",
                    style: TextStyle(fontStyle: FontStyle.italic, fontFamily: 'quoteScript'),
                  ),
                ],
              ),
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
