import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/user_provider.dart';
import './provider/book_provider.dart';
import './provider/group_provider.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './screens/book_screen.dart';
import './screens/book_details_screen.dart';
import './screens/manage_book_screen.dart';
import './screens/group_screen.dart';
import './screens/group_details_screen.dart';
import './screens/manage_group_screen.dart';
import './screens/profile_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => GroupProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        BookListScreen.routeName: (ctx) => BookListScreen(),
        BookDetailsScreen.routeName: (ctx) => BookDetailsScreen(),
        ManageBookScreen.routeName: (ctx) => ManageBookScreen(),
        GroupListScreen.routeName: (ctx) => GroupListScreen(),
        GroupDetailsScreen.routeName: (ctx) => GroupDetailsScreen(),
        ManageGroupScreen.routeName: (ctx) => ManageGroupScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
      },
    );
  }
}
