import 'dart:ui';

import 'package:flutter/material.dart';

class PendingScreen extends StatefulWidget {
  static const String id = '/pending_screen';
  @override
  _PendingScreenState createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Court'),
      ),
      body: Center(
        child: Text('Pending Screen'),
      ),
    );
  }
}
