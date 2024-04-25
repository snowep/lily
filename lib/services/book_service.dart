import 'dart:convert';
import 'dart:io';

import 'package:lily/models/books.dart';

class BookService {
  static Future<List<Book>> loadBooks() async {
    final file = File('lib/models/metadata.json');
    final contents = await file.readAsString();

    final Map<String, dynamic> json = jsonDecode(contents);
    final List<dynamic> bookObjects = json['books'];
    final List<dynamic> authorObjects = json['authors'];
    final List<dynamic> seriesObjects = json['series']; // Add this

    // Load authors into a Map for easy lookup
    final authors = <String, Author>{};
    for (var authorObject in authorObjects) {
      final author = Author.fromJson(authorObject);
      authors[author.id] = author;
    }

    // Load series into a Map for easy lookup
    final series = <String, Series>{}; // Add this
    for (var seriesObject in seriesObjects) {
      // Add this
      final serie = Series.fromJson(seriesObject); // Add this
      series[serie.id] = serie; // Add this
    } // Add this

    // Load books
    List<Book> books = [];
    for (var bookObject in bookObjects) {
      final book = Book(
        isbn: bookObject['isbn'],
        title: bookObject['title'],
        author: authors[bookObject['authorID']], // Look up author by ID
        imageCover: bookObject['imageCover'],
        description: bookObject['description'],
        status: bookObject['status'],
        isOwned: bookObject['isOwned'] ?? false,
        details: Details.fromJson(
          bookObject['details'],
          series[bookObject['details']['seriesID']],
        ), // Look up series by ID
      );

      books.add(book);
    }

    return books;
  }
}
