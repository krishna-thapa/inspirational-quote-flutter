import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/pages/quote/quote_of_the_day.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Container(
        decoration: baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Center(
              child: QuoteOfTheDayPage(),
            )
          ],
        ),
        )
    );
  }
}