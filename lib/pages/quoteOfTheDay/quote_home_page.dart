import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/pages/quoteOfTheDay/quote_of_the_day.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

class QuoteHomePage extends HookWidget {
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
              : Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: FadeAnimation(1.3, QuoteOfTheDayPage(quoteVm))),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                )),
    );
  }
}
