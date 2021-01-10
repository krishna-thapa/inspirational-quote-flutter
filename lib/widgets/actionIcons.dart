import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/env/globalVar.dart';
import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:inspirational_quote_flutter/viewmodels/random_quote_vm.dart';
import 'package:share/share.dart';

import 'animate_button.dart';

class ActionIcons extends HookWidget {
  const ActionIcons({this.isQuoteOfDay, this.quote, this.swiperController});

  final bool isQuoteOfDay;
  final Quote quote;
  final SwiperController swiperController;

  @override
  Widget build(BuildContext context) {
    final QuoteViewModel randomQuoteVm = useProvider(randomQuoteProvider);
    final GlobalVar globalVar = useProvider(globalVarNotifierProvider);
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: !isQuoteOfDay
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              refresh(randomQuoteVm),
              addQuote(context),
              share(quote),
            ])
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              arrowLeft(),
              likeQuote(globalVar),
              share(quote),
              arrowRight()
            ]),
    );
  }

  Widget refresh(QuoteViewModel quoteVm) {
    return AnimateButton(
      iconToAdd: FontAwesomeIcons.syncAlt,
      iconStartColor: Colors.black,
      valueChanged: (_isFavorite) {
        quoteVm.getRandomQuoteVM();
      },
    );
  }

  Widget addQuote(BuildContext context) {
    return AnimateButton(
      iconToAdd: Icons.playlist_add,
      iconSize: 60,
      valueChanged: (_isFavorite) {
        Scaffold.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 2,
          content: _isFavorite
              ? Text('Quote is added!', style: TextStyle(fontSize: 15))
              : Text('Quote is removed!', style: TextStyle(fontSize: 15)),
          duration: Duration(seconds: 1),
        ));
      },
    );
  }

  Widget arrowRight() {
    return AnimateButton(
      iconToAdd: FontAwesomeIcons.handPointRight,
      iconStartColor: Colors.black,
      animationTime: Duration(milliseconds: 0),
      valueChanged: (_isFavorite) {
        swiperController.next();
      },
    );
  }

  Widget arrowLeft() {
    return AnimateButton(
      iconToAdd: FontAwesomeIcons.handPointLeft,
      iconStartColor: Colors.black,
      animationTime: Duration(milliseconds: 0),
      valueChanged: (_isFavorite) {
        swiperController.previous();
      },
    );
  }

  Widget share(Quote quoteVm) {
    return AnimateButton(
      iconToAdd: FontAwesomeIcons.bullhorn,
      iconStartColor: Colors.black,
      valueChanged: (_isFavorite) {
        final shareQuote =
            "${quote.quote ?? "No quote"} - ${quote.author ?? "No author"} #${quote.genre ?? "No genre"}";
        Share.share(
          shareQuote,
          subject: "Quote to share",
        );
      },
    );
  }

  Widget likeQuote(GlobalVar favQuote) {
    return AnimateButton(
      isFavorite: favQuote.isFavQuote,
      valueChanged: (_isFavorite) {
        favQuote.setFavQuote(_isFavorite);
      },
    );
  }
}
