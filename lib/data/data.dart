import '../models/book.dart';
import '../models/group.dart';

final List<Book> sampleBooks = [
  Book(
    id: '1',
    title: '1984',
    author: 'George Orwell',
    genre: 'Dystopian',
    description: 'A dystopian social science fiction novel and cautionary tale about the dangers of totalitarianism.',
  ),
  Book(
    id: '2',
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    genre: 'Fiction',
    description: 'A novel about the serious issues of rape and racial inequality, but it is also filled with humor and warmth.',
  ),
  // Adicione mais livros conforme necessário
];

final List<Group> sampleGroups = [
  Group(
    id: '1',
    name: 'Book Lovers',
    description: 'A group for people who love to read and discuss books.',
    members: ['user1', 'user2'],
    books: ['1', '2'],
  ),
  Group(
    id: '2',
    name: 'Sci-Fi Enthusiasts',
    description: 'A group for fans of science fiction and speculative fiction.',
    members: ['user3', 'user4'],
    books: ['1'],
  ),
];
