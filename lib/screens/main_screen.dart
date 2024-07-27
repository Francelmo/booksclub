import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/book_provider.dart';
import '../provider/group_provider.dart';
import '../screens/book_details_screen.dart';
import '../screens/group_screen.dart';
import '../components/book_list.dart';
import '../components/group_list.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacementNamed('/book-details');
          break;
        case 1:
          Navigator.of(context).pushReplacementNamed('/group');
          break;
        case 2:
          Navigator.of(context).pushReplacementNamed('/profile');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clube do Livro'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Expanded(
            child: BookList(
              onTap: (book) {
                Navigator.of(context).pushNamed(
                  BookDetailsScreen.routeName,
                  arguments: book,
                );
              },
            ),
          ),
          Expanded(
            child: GroupList(
              onTap: (group) {
                Navigator.of(context).pushNamed(
                  GroupScreen.routeName,
                  arguments: group,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Livros'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Grupos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(
              title: Text('Configurações'),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
