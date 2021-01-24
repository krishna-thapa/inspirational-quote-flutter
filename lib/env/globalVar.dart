import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final globalVarNotifierProvider =
    ChangeNotifierProvider<GlobalVar>((ref) => GlobalVar());

class GlobalVar extends ChangeNotifier {
  int currentIndex = 0;
  bool isFavQuote = false;
  String quotesDate = "today's quote";
  String setJwtToken;

  void selectedPage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void setFavQuote(bool favQuote) {
    isFavQuote = favQuote;
    notifyListeners();
  }

  void setQuotesDate(String date) {
    quotesDate = date;
    notifyListeners();
  }

  void setJwtTokenKey(String jwtToken) {
    setJwtToken = jwtToken;
    notifyListeners();
  }
}
