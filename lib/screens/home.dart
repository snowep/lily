import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Book {
  final String title;
  final String author;
  final String? status;

  Book({required this.title, required this.author, this.status});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> books = <Book>[
    Book(
      title: 'Funiculi Funicula - Before the Coffee Gets Cold',
      author: 'Toshikazu Kawaguchi',
    ),
    Book(
      title: 'Funiculi Funicula: Kisah-Kisah Yang Baru Terungkap',
      author: 'Toshikazu Kawaguchi',
    ),
    Book(
      title: 'Dona Dona',
      author: 'Toshikazu Kawaguchi',
      status: 'new',
    ),
    Book(
      title: 'Hyouka',
      author: 'Yonezawa Honobu',
    ),
    Book(title: 'Book 4', author: 'Author 4'),
    // Add more books as needed
  ];

  int currentBookIndex = 0;
  double currentBookProgress = 0.5; // Value between 0.0 and 1.0

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Interact with the widget here
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'May be interesting',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ],
              ),
              Container(
                height: 203,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 150,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                child: Image.network(
                                  'https://placehold.co/100x150.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(height: 5),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 2,
                                  books[index].title.length >= 11
                                      ? books[index].title.substring(0, 11) +
                                          '...'
                                      : books[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  books[index].author.length >= 13
                                      ? books[index].author.substring(0, 13) +
                                          '...'
                                      : books[index].author,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildNewBookCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Popular',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewBookCard() {
    Book? newBook = books.firstWhere((book) => book.status == 'new');

    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                newBook.title.length >= 25
                    ? newBook.title.substring(0, 24) + '...'
                    : newBook.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              subtitle: Text(
                'by ' + newBook.author,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Container(
              height: 150,
              width: 150,
              child: Image.network(
                'https://placehold.co/100x150.jpg', // Replace with actual book cover image
              ),
            ),
          )
        ],
      ),
    );
  }
}
