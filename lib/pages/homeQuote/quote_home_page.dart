import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/pages/homeQuote/quote_card.dart';
import 'package:inspirational_quote_flutter/viewmodels/quoteOfDay_vm.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

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
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: FadeAnimation(0.2, QuoteCard()),
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
}
