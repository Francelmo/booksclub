import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/data.dart';
import '../models/group.dart';

class GroupProvider with ChangeNotifier {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Group> _groups = sampleGroups;

  List<Group> get groups => _groups;

  GroupProvider() {
    fetchGroups();
  }

  Future<void> fetchGroups() async {
    try {
      // final querySnapshot = await _firestore.collection('groups').get();
      // _groups = querySnapshot.docs
          // .map((doc) => Group.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          // .toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching groups: $error');
    }
  }

  Future<void> addGroup(Group group) async {
    try {
      // final docRef = await _firestore.collection('groups').add(group.toMap());
      _groups.add(Group(
        id: group.id, //docRef.id,
        name: group.name,
        description: group.description,
        members: group.members,
        books: group.books,
      ));
      notifyListeners();
    } catch (error) {
      print('Error adding group: $error');
    }
  }

  Future<void> updateGroup(Group group) async {
    try {
      // await _firestore.collection('groups').doc(group.id).update(group.toMap());
      final index = _groups.indexWhere((element) => element.id == group.id);
      if (index != -1) {
        _groups[index] = group;
        notifyListeners();
      }
    } catch (error) {
      print('Error updating group: $error');
    }
  }

  Future<void> deleteGroup(String id) async {
    try {
      // await _firestore.collection('groups').doc(id).delete();
      _groups.removeWhere((group) => group.id == id);
      notifyListeners();
    } catch (error) {
      print('Error deleting group: $error');
    }
  }

  Future<bool> addUserToGroup(String groupId, String userId) async {
    // try {
      // final groupDoc = await _firestore.collection('groups').doc(groupId).get();
      // if (groupDoc.exists) {
      //   final groupData = groupDoc.data();
      //   List<String> members = List<String>.from(groupData?['members'] ?? []);
      //   if (!members.contains(userId)) {
      //     members.add(userId);
      //     await _firestore.collection('groups').doc(groupId).update({
      //       'members': members,
      //     });

          final index = _groups.indexWhere((element) => element.id == groupId);
          if (index != -1) {
            _groups[index] = Group(
              id: _groups[index].id,
              name: _groups[index].name,
              description: _groups[index].description,
              members: groups[index].members , //members,
              books: _groups[index].books,
            );
            notifyListeners();
          }
          return true;
        // }
      // }
      // return false;
    // } catch (error) {
    //   print('Error adding user to group: $error');
    //   return false;
    // }
  }
}
