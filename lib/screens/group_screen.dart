import 'package:flutter/material.dart';
import '../models/group.dart';

class GroupScreen extends StatelessWidget {
  static const routeName = '/group';

  final Group group;

  GroupScreen({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Descrição: ${group.description}'),
          Text('Membros:'),
          Expanded(
            child: ListView.builder(
              itemCount: group.members.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(group.members[index]),
              ),
            ),
          ),
          Text('Livros:'),
          Expanded(
            child: ListView.builder(
              itemCount: group.books.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(group.books[index]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para se juntar ao clube
        },
        child: Icon(Icons.group_add),
      ),
    );
  }
}
