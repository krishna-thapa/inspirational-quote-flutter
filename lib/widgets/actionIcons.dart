import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:share/share.dart';

class ActionIcons extends HookWidget {
  ActionIcons(this.isQuoteOfDay);

  final bool isQuoteOfDay;

  @override
  Widget build(BuildContext context) {
    final QuoteViewModel quoteVm = useProvider(quoteProvider);
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: !isQuoteOfDay
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              refresh(quoteVm),
              like(quoteVm),
              share(quoteVm),
            ])
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              arrowLeft(),
              like(quoteVm),
              share(quoteVm),
              arrowRight()
            ]),
    );
  }

  Widget refresh(QuoteViewModel quoteVm) {
    return InkWell(
      onTap: () {
        quoteVm.getRandomQuote();
      },
      child: FaIcon(FontAwesomeIcons.syncAlt, size: 30, color: Colors.black),
    );
  }

  Widget like(QuoteViewModel quoteVm) {
    return InkWell(
      onTap: () {
        // Add your onPressed code here!
      },
      child: FaIcon(FontAwesomeIcons.star, size: 30, color: Colors.black),
    );
  }

  Widget arrowRight() {
    return InkWell(
      onTap: () {
        // Add your onPressed code here!
      },
      child: FaIcon(FontAwesomeIcons.handPointRight,
          size: 35, color: Colors.grey),
    );
  }

  Widget arrowLeft() {
    return InkWell(
      onTap: () {
        // Add your onPressed code here!
      },
      child:
          FaIcon(FontAwesomeIcons.handPointLeft, size: 35, color: Colors.black),
    );
  }

  Widget share(QuoteViewModel quoteVm) {
    return InkWell(
      onTap: () {
        final shareQuote =
            "${quoteVm.quote.quote} - ${quoteVm.quote.author} #${quoteVm.quote.genre}";
        Share.share(
          shareQuote,
          subject: "Quote to share",
        );
      },
      child: FaIcon(FontAwesomeIcons.bullhorn, size: 30, color: Colors.black),
    );
  }
}
