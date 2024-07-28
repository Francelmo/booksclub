import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigation({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Livros'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Grupos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
