import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';
import 'package:lily/screens/book_details.dart';
import 'package:lily/services/book_service.dart';

class BookListDataTable extends StatefulWidget {
  final int limit;
  final List<String> columns;
  const BookListDataTable(
      {super.key, required this.limit, required this.columns});

  @override
  State<BookListDataTable> createState() => _BookListDataTableState();
}

class _BookListDataTableState extends State<BookListDataTable> {
  List<Book> books = [];
  Iterable<int> numbers = List.generate(10, (i) => i + 1);

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  void loadBooks() async {
    books = await BookService.loadBooks();
    books.sort((a, b) {
      if (a.details!.ownerDetails!.purchaseDate != null &&
          b.details!.ownerDetails!.purchaseDate != null) {
        return a.details!.ownerDetails!.purchaseDate!
            .compareTo(b.details!.ownerDetails!.purchaseDate!);
      } else if (a.details!.ownerDetails!.purchaseDate != null) {
        return -1;
      } else if (b.details!.ownerDetails!.purchaseDate != null) {
        return 1;
      } else {
        return a.details!.readingDetails!.readingStatus!.startDate!
            .compareTo(b.details!.readingDetails!.readingStatus!.startDate!);
      }
    });
    setState(() {});
  }

  String formatPrice(double price) {
    String reversed = price.round().toString().split('').reversed.join('');
    String withCommas = RegExp(r".{1,3}")
        .allMatches(reversed)
        .map((match) => match.group(0))
        .join(',');
    String correctlyOriented = withCommas.split('').reversed.join('');
    return correctlyOriented;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: ['No.', ...widget.columns]
          .map(
            (column) => DataColumn(
              label: Text(
                column,
              ),
            ),
          )
          .toList(),
      rows: books.take(widget.limit).toList().asMap().entries.map((entry) {
        int index = entry.key;
        Book book = entry.value;
        return DataRow(
          cells: ['No.', ...widget.columns].map((column) {
            switch (column) {
              case 'No.':
                return DataCell(Text((index + 1).toString()));
              case 'Title':
                return DataCell(Text(book.title));
              case 'Author':
                return DataCell(Text(book.author!.name));
              case 'Price':
                return DataCell(Text(
                  book.details!.ownerDetails!.purchasePrice == null
                      ? 'N/A'
                      : 'Rp. ${formatPrice(book.details!.ownerDetails!.purchasePrice!.toDouble())}',
                ));
              default:
                return DataCell(Text(''));
            }
          }).toList(),
        );
      }).toList(),
    );
  }
}
