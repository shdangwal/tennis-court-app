import 'dart:io';
import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:court_app/models/Student.dart';
import 'package:court_app/models/Transaction.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String studentTable = 'students';
  String transactionTable = 'transactions';
  String studentId = "studentId";
  String studentPhone ="studetnPhone";
}