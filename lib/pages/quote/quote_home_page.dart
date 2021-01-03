import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/repository/quote_repository.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: QuoteRepository(),
      ),
    );
  }
}
