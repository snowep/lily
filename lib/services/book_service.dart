import 'dart:convert';
import 'dart:io';

import 'package:lily/models/books.dart';

class BookService {
  static Future<List<Book>> loadBooks() async {
    final file = File('lib/models/metadata.json');
    final contents = await file.readAsString();

    final Map<String, dynamic> json = jsonDecode(contents);
    final List<dynamic> nestedObjects = json['books'];

    List<Book> books = [];
    for (var nestedObject in nestedObjects) {
      final book = Book(
        isbn: nestedObject['isbn'],
        title: nestedObject['title'],
        author: nestedObject['authorID'],
        imageCover: nestedObject['imageCover'],
        description: nestedObject['description'],
        status: nestedObject['status'],
      );

      books.add(book);
    }

    return books;
  }
}
