import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/animations/FadeAnimation.dart';
import 'package:inspirational_quote_flutter/pages/errorBody/error_response_body.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:inspirational_quote_flutter/widgets/actionIcons.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

import 'quote_page.dart';

class RandomQuotePage extends HookWidget {
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
                    SizedBox(
                      height: 50,
                    ),
                    FadeAnimation(
                        0.1,
                        Image.asset(
                          'assets/images/quote.png',
                          width: size.width * 0.5,
                          alignment: Alignment.center,
                        )),
                    Expanded(child: FadeAnimation(0.2, QuotePage(quoteVm))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: FadeAnimation(0.3, ActionIcons(isQuoteOfDay: false,)),
                    )
                  ],
                )),
    );
  }
}
