import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:inspirational_quote_flutter/pages/quote/quote_home_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspirational quote',
      home: QuoteHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
