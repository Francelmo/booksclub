import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/group_provider.dart';
import '../models/group.dart';

class GroupList extends StatelessWidget {
  final Function(Group) onTap;

  GroupList({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, groupProvider, child) {
        final groups = groupProvider.groups;
        return ListView.builder(
          itemCount: groups.length,
          itemBuilder: (ctx, index) {
            final group = groups[index];
            return ListTile(
              title: Text(group.name),
              subtitle: Text(group.description),
              onTap: () => onTap(group),
            );
          },
        );
      },
    );
  }
}
