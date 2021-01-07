import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/viewmodels/quoteOfDay_vm.dart';
import 'package:inspirational_quote_flutter/widgets/actionIcons.dart';

class QuoteCard extends StatefulHookWidget {
  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    final QuoteOfDayViewModel quoteVm = useProvider(quoteOfDayProvider);
    return Swiper(
        itemHeight: MediaQuery.of(context).size.height - 80.0,
        itemWidth: MediaQuery.of(context).size.width - 40.0,
        loop: false,
        itemCount: 3,
        layout: SwiperLayout.STACK,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
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
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: quoteVm.loading
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
                                  alignment: Alignment.topLeft,
                                  height: 60,
                                  width: 60,
                                  color: Colors.black,
                                ),
                                Text(
                                  quoteVm.quote.quote,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: 'quoteScript'),
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
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
                                        text: " ${quoteVm.quote.author}",
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
                                        text: " ${quoteVm.quote.genre}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'quoteScript',
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ActionIcons(
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
