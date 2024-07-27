import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/book_provider.dart';
import '../models/book.dart';

class BookList extends StatelessWidget {
  final Function(Book) onTap;

  BookList({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
      builder: (context, bookProvider, child) {
        final books = bookProvider.books;
        return ListView.builder(
          itemCount: books.length,
          itemBuilder: (ctx, index) {
            final book = books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTap(book),
            );
          },
        );
      },
    );
  }
}
