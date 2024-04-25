import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';
import 'package:lily/screens/book_details.dart';
import 'package:lily/screens/catalog.dart';
import 'package:lily/services/book_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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

  List<String> genres = [
    'Fantasy',
    'Sci-Fi',
    'Mystery',
    'Thriller',
    'Romance',
    'Horror',
    'Adventure',
    'Non-Fiction',
  ];

  int currentBookIndex = 0;
  double currentBookProgress = 0.5;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          const SliverAppBar(
            toolbarHeight: 25,
            elevation: 0,
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextField(
                onChanged: (value) {
                  // Handle search input
                },
                decoration: const InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            _headerRow(
              'May be interesting',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Catalog(title: 'May be interesting', book: books),
                  ),
                );
              },
            ),
            SizedBox(
              height: 203,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookCard(
                    book: books[index],
                    index: index,
                    itemCount: books.length,
                    pageTitle: 'May be interesting',
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            _headerRow(
              'New',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Catalog(
                      title: 'New',
                      book: books,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            _buildNewBookCard(),
            _headerRow(
              'Popular',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Catalog(
                      title: 'Popular',
                      book: books,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 203,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookCard(
                    book: books[index],
                    index: index,
                    itemCount: books.length,
                    pageTitle: 'Popular',
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            _headerRow(
              'Genre',
              () {
                print('genre page');
              },
            ),
            const SizedBox(height: 10),
            _buildGenreChips(),
          ],
        ),
      ),
    );
  }

  int _currentIndex = 0;

  Widget _buildNewBookCard() {
    List<Book> newBooks = books.where((book) => book.status == 'new').toList();

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 200, // Adjust the height as needed
            child: PageView.builder(
              itemCount: newBooks.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(
                          book: newBooks[index],
                          pageTitle: 'New',
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(
                              newBooks[index].title.length >= 25
                                  ? '${newBooks[index].title.substring(0, 24)}...'
                                  : newBooks[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            subtitle: Text(
                              'by ${newBooks[index].author!.name}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 25, 16),
                          child: SizedBox(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              child: Image.network(
                                newBooks[index].imageCover,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          newBooks.isEmpty
              ? Container()
              : DotsIndicator(
                  dotsCount: newBooks.length,
                  position: _currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    activeColor: Colors.blue, // Change to your preferred color
                  ),
                ),
        ],
      ),
    );
  }

  Widget _headerRow(String headerTitle, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            headerTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildGenreChips() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Wrap(
        runAlignment: WrapAlignment.start,
        spacing: 5.0, // gap between adjacent chips
        runSpacing: 1.0, // gap between lines
        children: genres.map((String genre) {
          return ActionChip(
            visualDensity: VisualDensity.compact,
            label: Text(genre),
            onPressed: () {
              // Handle genre selection
            },
          );
        }).toList(),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  final int index;
  final int itemCount;
  final String pageTitle;

  const BookCard(
      {super.key,
      required this.book,
      required this.index,
      required this.itemCount,
      required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: (index == 0) ? 25 : 0, top: 8.0, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(
                    book: book,
                    pageTitle: pageTitle,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      book.imageCover,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        book.author!.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
