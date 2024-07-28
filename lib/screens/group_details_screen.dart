import 'package:flutter/material.dart';
import '../models/group.dart';

class GroupDetailsScreen extends StatelessWidget {
  static const routeName = '/group-details';

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context)!.settings.arguments as Group;

    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descrição:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(group.description),
            SizedBox(height: 10),
            Text('Membros:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: group.members.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(group.members[index]),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Livros:', style: TextStyle(fontWeight: FontWeight.bold)),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.group_add),
      ),
    );
  }
}
