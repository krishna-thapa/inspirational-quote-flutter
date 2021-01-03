import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

class RandomQuoteHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final QuoteViewModel quoteVm = useProvider(quoteProvider);
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    return Container(
        decoration: themeColor.baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: quoteVm.error
              ? ErrorBody(message: quoteVm.errorMsg)
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 580.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            color: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: BorderSide(
                                  color: Colors.teal,
                                  width: 5.0,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 50.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/quote_symbol.png',
                                    alignment: Alignment.centerLeft,
                                    height: 60,
                                    width: 60,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    quoteVm.quote.quote,
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'quoteScript'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    quoteVm.quote.author,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'quoteScript'),
                                  ),
                                  Text(
                                    quoteVm.quote.genre,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'quoteScript'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              quoteVm.getRandomQuote();
                                            },
                                            child: Icon(Icons.refresh,
                                                size: 35, color: Colors.black),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Add your onPressed code here!
                                            },
                                            child: Icon(Icons.content_copy,
                                                size: 30, color: Colors.black),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Add your onPressed code here!
                                            },
                                            child: Icon(Icons.share,
                                                size: 30, color: Colors.black),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            ),
                          ),
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
        ));
  }
}
