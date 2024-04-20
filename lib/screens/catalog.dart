import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';

class Catalog extends StatefulWidget {
  final String title;
  final List<Book> book;
  const Catalog({super.key, required this.title, required this.book});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
