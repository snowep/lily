import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';
import 'package:lily/screens/book_details.dart';
import 'package:lily/screens/catalog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Book> books = <Book>[
    Book(
      isbn: '978-1-56619-909-4',
      title: 'Funiculi Funicula - Before the Coffee Gets Cold',
      author: 'Toshikazu Kawaguchi',
      imageCover:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1618464562i/57743808.jpg',
      description:
          'Di sebuah gang kecil di Tokyo, ada kafe tua yang bisa membawa pengunjungnya menjelajahi waktu. Keajaiban kafe itu menarik seorang wanita yang ingin memutar waktu untuk berbaikan dengan kekasihnya, seorang perawat yang ingin membaca surat yang tak sempat diberikan suaminya yang sakit, seorang kakak yang ingin menemui adiknya untuk terakhir kali, dan seorang ibu yang ingin bertemu dengan anak yang mungkin takkan pernah dikenalnya. Namun ada banyak peraturan yang harus diingat. Satu, mereka harus tetap duduk di kursi yang telah ditentukan. Dua, apa pun yang mereka lakukan di masa yang didatangi takkan mengubah kenyataan di masa kini. Tiga, mereka harus menghabiskan kopi khusus yang disajikan sebelum kopi itu dingin. Rentetan peraturan lainnya tak menghentikan orang-orang itu untuk menjelajahi waktu. Akan tetapi, jika kepergian mereka tak mengubah satu hal pun di masa kini, layakkah semua itu dijalani?',
    ),
    Book(
      isbn: '978-1-56619-909-5',
      title: 'Funiculi Funicula: Kisah-Kisah Yang Baru Terungkap',
      author: 'Toshikazu Kawaguchi',
      imageCover:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1665325911i/62917178.jpg',
      description:
          'Funiculi Funicula, sebuah kafe di gang sempit di Tokyo, masih kerap didatangi orang-orang yang ingin menjelajahi waktu. Peraturan-peraturan yang merepotkan masih berlaku, tetapi itu semua tidak menyurutkan harapan mereka untuk memutar waktu.'
          'Kali ini ada seorang pria yang ingin kembali ke masa lalu untuk menemui sahabat yang putrinya ia besarkan, seorang putra putus asa yang tidak menghadiri pemakaman ibunya, seorang pria sekarat yang ingin melompat ke dua tahun kemudian untuk memastikan kekasihnya bahagia, dan seorang detektif yang ingin memberi istrinya hadiah ulang tahun untuk pertama sekaligus terakhir kalinya.'
          'Kenyataan memang akan tetap sama. Namun dalam singkatnya durasi sampai kopi mendingin, mungkin masih tersisa waktu bagi mereka untuk menghapus penyesalan, membebaskan diri dari rasa bersalah, atau mungkin melihat terwujudnya harapan…',
    ),
    Book(
      isbn: '978-1-56619-909-6',
      title: 'Dona Dona',
      author: 'Toshikazu Kawaguchi',
      status: 'new',
      imageCover:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1689076927i/187714691.jpg',
      description:
          'Di sebuah lereng indah tak bernama di Hakodate, Hokkaido, berdiri Kafe Dona Dona yang menawarkan layanan istimewa kepada pengunjungnya: perjalananan melintasi waktu. Seperti di Funiculi Funicula yang ada di Tokyo, hal tersebut hanya dapat dilakukan jika berbagai peraturan yang merepotkan dipenuhi dan dengan secangkir kopi yang dituangkan oleh perempuan di keluarga Tokita.',
    ),
    Book(
      isbn: '978-1-56619-909-7',
      title: 'Hyouka',
      author: 'Yonezawa Honobu',
      imageCover:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1511596961i/36657793.jpg',
      description:
          'Kalau kita menyelidikinya, mungkin akan terjadi hal-hal yang tidak baik.'
          'Oreki Hotaro adalah pemuda hemat energi. Mottonya adalah, “Kalau tidak perlu dikerjakan, lebih baik tidak usah dikerjakan. Tapi kalau harus dikerjakan, lakukan dengan praktis.” Hanya saja, semua itu berubah saat dia terpaksa bergabung dengan Klub Sastra Klasik. Chitanda Eru—gadis dengan rasa penasaran yang tinggi—mengubah hari-hari Hotaro, dan dia harus memecahkan misteri demi misteri yang terjadi di sekitar mereka.'
          'Gara-gara Chitanda, mereka dihadapkan pada kasus 33 tahun yang lalu. Hanya saja, petunjuk mereka hanyalah sebuah antologi berjudul Hyouka.',
    ),
    Book(
      isbn: '978-1-56619-909-8',
      title: 'Credit Roll of the Fool',
      author: 'Yonezawa Honobu',
      status: 'new',
      imageCover:
          'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1525076081i/39997626.jpg',
      description:
          'Oreki Hotaro lagi-lagi terseret oleh rasa ingin tahu Chitanda Eru. Melawan keinginannya, kali ini Hotaro harus menebak penyelesaian skenario naskah film misteri kelas 2-F yang akan ditayangkan saat Festival Kanya nanti.'
          'Seorang siswa terjebak dalam kamar tertutup bangunan terbengkelai, mati setelah tangannya terpotong. Namun, siapa yang membunuh? Bagaimana caranya? Film itu selesai begitu saja tanpa penjelasan. Hotaro-lah yang bertugas untuk menebak siapa ada bagaimana trik pembunuhan itu dilakukan.'
          'Namun, hanya itukah masalahnya?'
          'Atau ada sesuatu yang lebih besar dari sekedar menyelesaikan skenario film?',
    ),

    // Add more books as needed
  ];

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
                              'by ${newBooks[index].author}',
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
          DotsIndicator(
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
                        book.author,
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
