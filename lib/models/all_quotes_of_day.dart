import 'package:inspirational_quote_flutter/models/quote.dart';

List<AllQuotesOfDay> allQuotesModelFromJson(List<dynamic> str) =>
    List<AllQuotesOfDay>.from(str.map((x) => AllQuotesOfDay.fromJson(x)));

class AllQuotesOfDay {
  final int id;
  final String contentDate;
  final Quote quote;
  final bool isFavQuote;

  AllQuotesOfDay({this.id, this.contentDate, this.isFavQuote, this.quote});

  factory AllQuotesOfDay.fromJson(Map<String, dynamic> json) {
    return AllQuotesOfDay(
        id: json['id'],
        contentDate: json['contentDate'],
        isFavQuote: json['isFavQuote'],
        quote: Quote.fromJson(json['quote']));
  }
}
