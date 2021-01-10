import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/pages/shared/quote-text.dart';
import 'package:inspirational_quote_flutter/viewmodels/quotesOfDay_vm.dart';
import 'package:inspirational_quote_flutter/widgets/actionIcons.dart';

class QuoteCard extends StatefulHookWidget {
  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    final QuotesOfDayViewModel allQuotesOfDay =
        useProvider(quotesOfDayProvider);
    return allQuotesOfDay.loading
        ? Center(child: CircularProgressIndicator())
        : Swiper(
            itemHeight: MediaQuery.of(context).size.height - 80.0,
            itemWidth: MediaQuery.of(context).size.width - 40.0,
            itemCount: allQuotesOfDay.quote.length,
            layout: SwiperLayout.STACK,
            loop: false,
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              final Quote quote = allQuotesOfDay.quote.elementAt(index).quote;
              return Card(
                color: Colors.green[300],
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(
                      color: Colors.teal,
                      width: 5.0,
                    )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                            child: QuoteInText(
                          quote: quote,
                          isQuoteOfDay: true,
                        )),
                      ),
                      ActionIcons(
                        quote: quote,
                        isQuoteOfDay: true,
                        swiperController: _controller,
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
