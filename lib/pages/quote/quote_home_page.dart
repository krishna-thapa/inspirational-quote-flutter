import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/repository/quote_repository.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage>
    with AutomaticKeepAliveClientMixin {
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
              child: QuoteRepository(),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                // Add your onPressed code here!
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
    );
  }
}
