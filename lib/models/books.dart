class Book {
  final String isbn;
  final String title;
  final Author? author; // Change this from authorID to author
  final String imageCover;
  final String? status;
  final String? description;
  final bool? isOwned;
  final Details? details;

  Book({
    required this.isbn,
    required this.title,
    required this.author, // And this
    required this.imageCover,
    this.description,
    this.status,
    required this.isOwned,
    this.details,
  });

  factory Book.fromJson(Map<String, dynamic> json, Author author) {
    return Book(
      isbn: json['isbn'],
      title: json['title'],
      author: author, // And this
      imageCover: json['imageCover'],
      description: json['description'],
      status: json['status'],
      isOwned: json['isOwned'],
    );
  }
}

class Details {
  final int totalPage;
  final Series? series;
  final int? volume;
  final ReadingDetails? readingDetails;

  Details(
      {this.series, this.volume, required this.totalPage, this.readingDetails});

  factory Details.fromJson(
    Map<String, dynamic> json,
    Series? series,
  ) {
    return Details(
      totalPage: json['totalPage'],
      series: series,
      volume: json['volume'],
      readingDetails: json['readingDetails'] != null
          ? ReadingDetails.fromJson(json['readingDetails'])
          : null,
    );
  }
}

class ReadingDetails {
  final bool? isReading;
  final int currentPage;

  ReadingDetails({this.isReading, required this.currentPage});

  factory ReadingDetails.fromJson(Map<String, dynamic> json) {
    return ReadingDetails(
      isReading: json['isReading'],
      currentPage: json['currentPage'],
    );
  }
}

class Series {
  final String id;
  final String title;

  Series({required this.id, required this.title});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      title: json['title'],
    );
  }
}

class Author {
  final String id;
  final String name;

  Author({required this.id, required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
    );
  }
}
