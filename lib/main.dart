import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/all.dart';

import 'env/globalVar.dart';
import 'pages/homeQuote/quote_home_page.dart';
import 'pages/login/login_home_page.dart';
import 'pages/randomQuote/random_quote_page.dart';
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
  static List<Widget> listScreens = <Widget>[
    QuoteHomePage(),
    RandomQuotePage(),
    SearchQuoteHomePage(),
    LoginHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeColor themeColor = useProvider(themeColorNotifierProvider);
    final GlobalVar globalVar = useProvider(globalVarNotifierProvider);

    return MaterialApp(
        title: 'Inspirational quote',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: listScreens.elementAt(globalVar.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: themeColor.navigationBarBackground,
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.quoteLeft),
                title: Text(
                  'Today',
                ),
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.random),
                  title: Text('Discover')),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.search), title: Text('Search')),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.userCircle),
                  title: Text('Account'))
            ],
            currentIndex: globalVar.currentIndex,
            onTap: globalVar.selectedPage,
            selectedItemColor: themeColor.black,
            selectedIconTheme: IconThemeData(size: 25.0),
            unselectedItemColor: themeColor.white,
            unselectedIconTheme: IconThemeData(size: 20.0),
          ),
        ));
  }
}
