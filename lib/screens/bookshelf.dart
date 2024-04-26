import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';
import 'package:lily/screens/book_details.dart';
import 'package:lily/services/book_service.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf>
    with SingleTickerProviderStateMixin {
  List<Book> books = [];
  late TabController _tabController;
  int selectedTab = 0;
  String dropdownValue = 'Title';

  @override
  void initState() {
    super.initState();
    loadBooks();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      selectedTab = _tabController.index;
    });
  }

  void loadBooks() async {
    books = await BookService.loadBooks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final finishedBooks = books
        .where((book) =>
            book.details!.readingDetails?.isReading == false &&
            book.details!.readingDetails?.currentPage ==
                book.details!.totalPage)
        .toList();

    final inProgressBooks = books
        .where((book) =>
            book.details!.readingDetails?.isReading == true &&
                book.details!.readingDetails?.currentPage ==
                    book.details!.totalPage ||
            book.details!.readingDetails?.isReading == false &&
                book.details!.readingDetails?.currentPage !=
                    book.details!.totalPage)
        .toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  if (selectedTab == 0)
                    Text(
                      'Finished: ${finishedBooks.length} Book${finishedBooks.length > 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  else
                    Text(
                      'In Progress: ${inProgressBooks.length} Book${inProgressBooks.length > 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                ],
              ),
            ),
            Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Finished'),
                    Tab(text: 'In Progress'),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: finishedBooks.length,
                    itemBuilder: (context, index) {
                      final book = finishedBooks[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetails(
                                book: book,
                                pageTitle: 'Finished',
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(book.imageCover),
                          title: Text(
                            book.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subtitle: Text(book.author!.name),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: inProgressBooks.length,
                    itemBuilder: (context, index) {
                      final book = inProgressBooks[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetails(
                                book: book,
                                pageTitle: 'In Progress',
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(book.imageCover),
                          title: Text(
                            book.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(book.author!.name),
                              LinearProgressIndicator(
                                value:
                                    book.details!.readingDetails!.currentPage /
                                        book.details!.totalPage,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Add book manually'),
          icon: const Icon(Icons.add),
          clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }
}
