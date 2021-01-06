import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/viewmodels/quoteOfDay_vm.dart';
import 'package:inspirational_quote_flutter/widgets/actionIcons.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

//class QuoteHomePage extends StatefulHookWidget {
//  @override
//  _QuoteHomePageState createState() => _QuoteHomePageState();
//}

class QuoteHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final QuoteOfDayViewModel quoteVm = useProvider(quoteOfDayProvider);
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
                    FadeAnimation(
                        0.1,
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset(
                            'assets/images/quote_of_the_day.png',
                            width: size.width * 0.9,
                            alignment: Alignment.center,
                          ),
                        )),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 580.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: FadeAnimation(0.2, quoteContent(quoteVm)),
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

  Widget quoteContent(QuoteOfDayViewModel quoteVm) {
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
                  ActionIcons(true),
                ],
              ),
      ),
    );
  }
}
