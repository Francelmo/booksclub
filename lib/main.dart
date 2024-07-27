import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'provider/book_provider.dart';
import 'provider/group_provider.dart';
import 'provider/user_provider.dart';
import 'screens/book_details_screen.dart';
import 'screens/group_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/main_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/manage_book_screen.dart';
import 'models/book.dart';
import 'models/group.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Erro ao inicializar o Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookProvider()),
        ChangeNotifierProvider(create: (context) => GroupProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Book Club App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          MainScreen.routeName: (ctx) => MainScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          ManageBookScreen.routeName: (ctx) => ManageBookScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == BookDetailsScreen.routeName) {
            final book = settings.arguments as Book;
            return MaterialPageRoute(
              builder: (ctx) => BookDetailsScreen(book: book),
            );
          } else if (settings.name == GroupScreen.routeName) {
            final group = settings.arguments as Group;
            return MaterialPageRoute(
              builder: (ctx) => GroupScreen(group: group),
            );
          }
          return null;
        },
      ),
    );
  }
}
