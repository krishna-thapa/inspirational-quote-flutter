import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:share/share.dart';

class ActionIcons extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final QuoteViewModel quoteVm = useProvider(quoteProvider);
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
            final shareQuote =
                "${quoteVm.quote.quote} - ${quoteVm.quote.author} #${quoteVm.quote.genre}";
            Share.share(
              shareQuote,
              subject: "Quote to share",
            );
          },
          child:
              FaIcon(FontAwesomeIcons.bullhorn, size: 30, color: Colors.black),
        )
      ]),
    );
  }
}
