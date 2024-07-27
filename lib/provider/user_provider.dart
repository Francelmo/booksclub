import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  late Userr _currentUser;

  Userr get currentUser => _currentUser;

  void setUser(Userr user) {
    _currentUser = user;
    notifyListeners();
  }

  final List<Userr> _testUsers = [
    Userr(id: '1', name: 'Test User', email: 'test@example.com'),
  ];

  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    final user = _testUsers.firstWhere(
      (user) => user.email == email,
      orElse: () => throw Exception('Invalid email or password'),
    );

    if (password == 'password123') {
      _currentUser = user;
      notifyListeners();
    } else {
      throw Exception('Invalid email or password');
    }
  }

  Future<void> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    if (_testUsers.any((user) => user.email == email)) {
      throw Exception('Email already exists');
    }

    final newUser = Userr(id: DateTime.now().toString(), name: name, email: email);
    _testUsers.add(newUser);
    _currentUser = newUser;
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser = Userr(id: '', name: '', email: '');
    notifyListeners();
  }
}
