import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/apiResponse/quote_Response.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<Quote> quoteOfTheDay;

  @override
  void initState() {
    super.initState();
    quoteOfTheDay = fetchQuoteOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //should be inside the Scaffold
    return FutureBuilder<Quote>(
      future: quoteOfTheDay,
      builder: (context, response) {
        if(response.hasData) {
          return Scaffold(
            body: Container(
              decoration: baseBackgroundDecoration,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    ),
                    Text(response.data.quote),
                    Text(response.data.author),
                    Text(response.data.genre),
                  ],
                ),
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