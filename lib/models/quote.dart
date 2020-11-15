class Quote {
  final int id;
  final String csvId;
  final String quote;
  final String author;
  final String genre;

  Quote({this.id, this.csvId, this.quote, this.author, this.genre});

  // Quote.fromJson will parse the JSON response from the API and return the response.
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      csvId: json['csvid'],
      quote: json['quote'],
      author: json['author'],
      genre: json['genre']
    );
  }
}