import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';
import 'package:lily/screens/book_details.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Bookshelf',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Spacer(),
                    Text('${books.length} book${books.length > 1 ? 's' : ''}')
                  ],
                ),
              ),
              TabBar(
                tabs: [
                  Tab(text: 'Finished'),
                  Tab(text: 'In Progress'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetails(
                                  book: books[index],
                                  pageTitle: 'Owned Book',
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image.network(books[index].imageCover),
                            title: Text(
                              books[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            subtitle: Text(books[index].author!.name),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetails(
                                  book: books[index],
                                  pageTitle: 'Wishlist Book',
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image.network(books[index].imageCover),
                            title: Text(
                              books[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            subtitle: Text(books[index].author!.name),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add new book
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
