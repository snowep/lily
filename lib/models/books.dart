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

class Book {
  final String isbn;
  final String title;
  final String author;
  final String imageCover;
  final String? status;
  final String? description;

  Book(
      {required this.isbn,
      required this.title,
      required this.author,
      required this.imageCover,
      this.description,
      this.status});
}
