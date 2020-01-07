import 'package:flutter/material.dart';
import 'package:court_app/screens/pending_screen.dart';
import 'package:court_app/screens/transaction_screen.dart';
import 'package:court_app/screens/student_screen.dart';
import 'package:court_app/screens/welcome_screen.dart';

final routes = {
  PendingScreen.id: (BuildContext context) => PendingScreen(),
  TransactionScreen.id: (BuildContext context) => TransactionScreen(),
  StudentScreen.id: (BuildContext context) => StudentScreen(),
  WelcomeScreen.id: (BuildContext context) => WelcomeScreen(),
};