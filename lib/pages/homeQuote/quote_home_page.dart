import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/env/globalVar.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/pages/homeQuote/quote_card.dart';
import 'package:inspirational_quote_flutter/view_models/quotesOfDay_vm.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

class QuoteHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final QuotesOfDayViewModel allQuotesOfDay =
        useProvider(quotesOfDayProvider);
    final GlobalVar globalVar = useProvider(globalVarNotifierProvider);
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: themeColor.baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: allQuotesOfDay.error
              ? ErrorBody(isQuoteOfDay: true, message: allQuotesOfDay.errorMsg)
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
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: FadeAnimation(0.2, QuoteCard()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Opacity(
                              opacity: .6,
                              child: Text(
                                "${globalVar.quotesDate}",
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
}
