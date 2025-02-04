import 'package:flutter/material.dart';
import '../components/group_list.dart';
import '../components/bottom_navigation.dart';
import '../models/group.dart';
import 'group_details_screen.dart';
import 'manage_group_screen.dart';

class GroupListScreen extends StatefulWidget {
  static const routeName = '/groups';

  @override
  _GroupListScreenState createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacementNamed('/books');
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
        title: Text('Grupos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ManageGroupScreen.routeName);
            },
          ),
        ],
      ),
      body: GroupList(
        onTap: (group) {
          Navigator.of(context).pushNamed(
            GroupDetailsScreen.routeName,
            arguments: group,
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
