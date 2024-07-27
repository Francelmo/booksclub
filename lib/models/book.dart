class Book {
  final String id;
  final String title;
  final String author;
  final String genre;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
  });

  factory Book.fromMap(Map<String, dynamic> data, String id) {
    return Book(
      id: id,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      genre: data['genre'] ?? '',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'genre': genre,
      'description': description,
    };
  }
}
