import 'package:flutter/material.dart';
import 'package:lily/comps/book_list_table.dart';
import 'package:lily/models/books.dart';
import 'package:lily/services/book_service.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  List<Book> books = [];
  late TabController _tabController;
  int selectedTab = 0;

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              Column(
                children: [
                  const BookListDataTable(
                    limit: 5,
                    columns: ['Title', 'Author'],
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('See more books...'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
