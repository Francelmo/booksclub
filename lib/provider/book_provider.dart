import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/data.dart';
import '../models/book.dart';

class BookProvider with ChangeNotifier {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Book> _books = sampleBooks;

  List<Book> get books => _books;

  BookProvider() {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      // final querySnapshot = await _firestore.collection('books').get();
      // _books = querySnapshot.docs
          // .map((doc) => Book.fromMap(doc.data(), doc.id))
          // .toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching books: $error');
    }
  }

  Future<void> addBook(Book book) async {
    try {
      // final docRef = await _firestore.collection('books').add(book.toMap());
      _books.add(Book(
        id: book.id, //docRef.id,
        title: book.title,
        author: book.author,
        genre: book.genre,
        description: book.description,
      ));
      notifyListeners();
    } catch (error) {
      print('Error adding book: $error');
    }
  }

  Future<void> updateBook(Book book) async {
    try {
      // await _firestore.collection('books').doc(book.id).update(book.toMap());
      final index = _books.indexWhere((element) => element.id == book.id);
      if (index != -1) {
        _books[index] = book;
        notifyListeners();
      }
    } catch (error) {
      print('Error updating book: $error');
    }
  }

  Future<void> deleteBook(String bookId) async {
    try {
      // await _firestore.collection('books').doc(bookId).delete();
      _books.removeWhere((book) => book.id == bookId);
      notifyListeners();
    } catch (error) {
      print('Error deleting book: $error');
    }
  }
}
