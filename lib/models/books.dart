class Book {
  final String isbn;
  final String title;
  final Author? author; // Change this from authorID to author
  final String imageCover;
  final String? status;
  final String? description;

  Book({
    required this.isbn,
    required this.title,
    required this.author, // And this
    required this.imageCover,
    this.description,
    this.status,
  });

  factory Book.fromJson(Map<String, dynamic> json, Author author) {
    return Book(
      isbn: json['isbn'],
      title: json['title'],
      author: author, // And this
      imageCover: json['imageCover'],
      description: json['description'],
      status: json['status'],
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
