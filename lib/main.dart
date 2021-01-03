import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:inspirational_quote_flutter/pages/quoteOfTheDay/quote_home_page.dart';
import 'package:inspirational_quote_flutter/widgets/colors.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    return MaterialApp(
        title: 'Inspirational quote',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: QuoteHomePage(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: themeColor.navigationBarBackground,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.format_quote),
                title: Text(
                  'Today',
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shuffle), title: Text('Discover')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('Search')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('Account'))
            ],
            currentIndex: 0,
            selectedItemColor: themeColor.accent,
            unselectedItemColor: themeColor.background,
          ),
        ));
  }
}
