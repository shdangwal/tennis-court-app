import 'dart:ui';

import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  static const String id = '/students_screen';

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Court'),
      ),
      body: Center(
        child: Text('Student Screen'),
      ),
    );
  }
}