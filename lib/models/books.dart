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
