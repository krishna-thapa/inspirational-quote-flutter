import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import 'pages/login/login_home_page.dart';
import 'pages/quoteOfTheDay/quote_home_page.dart';
import 'pages/randomQuotes/random_quote_home_page.dart';
import 'pages/searchQuote/search_quote_home_page.dart';
import 'widgets/colors.dart';

void main() {
  runApp(ProviderScope(child: HomePage()));
}

class HomePage extends StatefulHookWidget {
  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  static List<Widget> listScreens = <Widget>[
    QuoteHomePage(),
    RandomQuoteHomePage(),
    SearchQuoteHomePage(),
    LoginHomePage(),
  ];

  void selectedPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    return MaterialApp(
        title: 'Inspirational quote',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: listScreens.elementAt(currentIndex),
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
            currentIndex: currentIndex,
            onTap: selectedPage,
            selectedItemColor: themeColor.accent,
            unselectedItemColor: themeColor.background,
          ),
        ));
  }
}
