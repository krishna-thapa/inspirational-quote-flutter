import 'package:inspirational_quote_flutter/models/quote.dart';

List<AllQuotesOfDay> allQuotesModelFromJson(List<dynamic> str) =>
    List<AllQuotesOfDay>.from(str.map((x) => AllQuotesOfDay.fromJson(x)));

class AllQuotesOfDay {
  final int id;
  final String contentDate;
  final Quote quote;

  AllQuotesOfDay({this.id, this.contentDate, this.quote});

  factory AllQuotesOfDay.fromJson(Map<String, dynamic> json) {
    return AllQuotesOfDay(
        id: json['id'], contentDate: json['csvid'], quote: json['quote']);
  }
}
