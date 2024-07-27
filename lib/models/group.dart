class Group {
  final String id;
  final String name;
  final String description;
  List<String> members;
  List<String> books;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.books,
  });

  factory Group.fromMap(Map<String, dynamic> data, String id) {
    return Group(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      members: List<String>.from(data['members'] ?? []),
      books: List<String>.from(data['books'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'members': members,
      'books': books,
    };
  }
}
