import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../provider/book_provider.dart';

class ManageBookScreen extends StatelessWidget {
  static const routeName = '/manage';

  final Book? book;

  ManageBookScreen({this.book});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _genreController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (book != null) {
      _titleController.text = book!.title;
      _authorController.text = book!.author;
      _genreController.text = book!.genre;
      _descriptionController.text = book!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(book == null ? 'Adicionar Livro' : 'Editar Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o autor';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(labelText: 'Gênero'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o gênero';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final newBook = Book(
                      id: book?.id ?? DateTime.now().toString(),
                      title: _titleController.text,
                      author: _authorController.text,
                      genre: _genreController.text,
                      description: _descriptionController.text,
                    );

                    if (book == null) {
                      Provider.of<BookProvider>(context, listen: false).addBook(newBook);
                    } else {
                      Provider.of<BookProvider>(context, listen: false).updateBook(newBook);
                    }

                    Navigator.of(context).pop();
                  }
                },
                child: Text(book == null ? 'Adicionar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
