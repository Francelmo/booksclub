class Userr {
  final String id;
  final String name;
  final String email;

  Userr({required this.id, required this.name, required this.email});

  factory Userr.fromMap(Map<String, dynamic> data, String documentId) {
    return Userr(
      id: documentId,
      name: data['name'] as String,
      email: data['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
