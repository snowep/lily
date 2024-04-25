import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';
import 'package:lily/services/book_service.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  void loadBooks() async {
    books = await BookService.loadBooks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookshelf'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(books[index].imageCover),
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
          );
        },
      ),
    );
  }
}
