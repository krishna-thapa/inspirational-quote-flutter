import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';

class QuoteOfTheDayPage extends StatefulWidget {
  final Quote quote;

  const QuoteOfTheDayPage(this.quote);

  @override
  _QuoteOfTheDayPageState createState() => _QuoteOfTheDayPageState();
}

class _QuoteOfTheDayPageState extends State<QuoteOfTheDayPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(1.3, Container(
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/quote_of_the_day.png'),
                ),
              ),
            )),
          //Spacer(flex: 2,),
          Image.asset(
            'assets/images/quote_symbol.png',
            height: 60,
            width: 60,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.quote.quote,
            style: TextStyle(fontSize: 30.0, fontFamily: 'quoteScript'),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            widget.quote.author,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'quoteScript'),
          ),
          Text(
            "#${widget.quote.genre}",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontFamily: 'quoteScript'),
          ),
        ],
      ),
    );
  }
}
