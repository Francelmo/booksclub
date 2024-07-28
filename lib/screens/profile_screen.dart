import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import '../components/bottom_navigation.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacementNamed('/books');
          break;
        case 1:
          Navigator.of(context).pushReplacementNamed('/groups');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: ${user.name}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
