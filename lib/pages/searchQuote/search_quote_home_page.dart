import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

class SearchQuoteHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    return Container(
        decoration: themeColor.baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Text("Search Quote"),
        ));
  }
}
