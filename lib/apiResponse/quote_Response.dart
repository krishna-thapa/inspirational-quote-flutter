import 'dart:convert';

import 'package:inspirational_quote_flutter/models/quote.dart';
import 'package:http/http.dart' as http;

// call the API '/quote/quoteOfTheDay' and fetch the response
Future<Quote> fetchQuoteOfTheDay() async {
  final response = await http.get('http://localhost:9000/quote/quoteOfTheDay');
  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Quote');
  }
}