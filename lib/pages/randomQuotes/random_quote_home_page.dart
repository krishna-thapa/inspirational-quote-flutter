import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

class RandomQuoteHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final QuoteViewModel quoteVm = useProvider(quoteProvider);
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: themeColor.baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: quoteVm.error
              ? ErrorBody(message: quoteVm.errorMsg)
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                      child: Image.asset(
                        'assets/images/quote.png',
                        width: size.width * 0.5,
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 580.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: quoteContent(quoteVm),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Opacity(
                              opacity: .6,
                              child: Text(
                                "today's quote",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ));
  }

  Widget quoteContent(QuoteViewModel quoteVm) {
    return Card(
      color: Colors.green[300],
      elevation: 6.0,
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
                        //mainAxisAlignment: MainAxisAlignment.center,
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
                                fontSize: 30.0, fontFamily: 'quoteScript'),
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\u{270D} ",
                                  style: TextStyle(
                                      fontSize: 40.0, color: Colors.black),
                                ),
                                TextSpan(
                                  text: quoteVm.quote.author,
                                  style: TextStyle(
                                      fontSize: 20.0,
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
                  actionIcons(quoteVm),
                ],
              ),
      ),
    );
  }

  Widget actionIcons(QuoteViewModel quoteVm) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
          Widget>[
        InkWell(
          onTap: () {
            quoteVm.getRandomQuote();
          },
          child:
              FaIcon(FontAwesomeIcons.syncAlt, size: 30, color: Colors.black),
        ),
        InkWell(
          onTap: () {
            // Add your onPressed code here!
          },
          child: FaIcon(FontAwesomeIcons.star, size: 30, color: Colors.black),
        ),
        InkWell(
          onTap: () {
            //final RenderBox box = context.findRenderObject();
          },
          child:
              FaIcon(FontAwesomeIcons.bullhorn, size: 30, color: Colors.black),
        )
      ]),
    );
  }
}
