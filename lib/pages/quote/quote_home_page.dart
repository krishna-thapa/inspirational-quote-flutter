import 'package:flutter/material.dart';
import 'package:inspirational_quote_flutter/repository/quote_repository.dart';
import 'package:inspirational_quote_flutter/widgets/background_login.dart';
import 'package:inspirational_quote_flutter/viewmodels/quote_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //final quoteVm = useProvider(quoteProvider);

    return Scaffold(
      body: Container(
        decoration: baseBackgroundDecoration,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: QuoteRepository(),
      ),
    );
  }
}
