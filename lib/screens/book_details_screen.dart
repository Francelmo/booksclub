import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  static const routeName = '/book-details';

  @override
  Widget build(BuildContext context) {
    final Book book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Autor: ${book.author}'),
            Text('Gênero: ${book.genre}'),
            Text('Descrição: ${book.description}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
