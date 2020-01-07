import 'package:flutter/material.dart';
import 'package:court_app/routes.dart';
import 'package:court_app/screens/pending_screen.dart';
import 'package:court_app/screens/student_screen.dart';
import 'package:court_app/screens/transaction_screen.dart';
import 'package:court_app/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Court App',
      theme: ThemeData(
        primaryColor: Color(0xFF009688),
        accentColor: Colors.brown,
        primaryColorDark: Color(0xFF00796B),
        dividerColor: Color(0xFFBDBDBD),
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xFF212121)),
          body2: TextStyle(color: Color(0xFF757575)),
        ),
        iconTheme: IconThemeData(
          color: Colors.brown,
        ),
      ),
      // home: PendingScreen(),
      initialRoute: StudentScreen.id,
      routes: routes,
    );
  }
}
