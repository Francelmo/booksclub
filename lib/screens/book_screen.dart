import 'package:flutter/material.dart';
import '../components/book_list.dart';
import '../components/bottom_navigation.dart';
import '../models/book.dart';
import 'book_details_screen.dart';
import 'manage_book_screen.dart';

class BookListScreen extends StatefulWidget {
  static const routeName = '/books';

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      switch (index) {
        case 1:
          Navigator.of(context).pushReplacementNamed('/groups');
          break;
        case 2:
          Navigator.of(context).pushReplacementNamed('/profile');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ManageBookScreen.routeName);
            },
          ),
        ],
      ),
      body: BookList(
        onTap: (book) {
          Navigator.of(context).pushNamed(
            BookDetailsScreen.routeName,
            arguments: book,
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
