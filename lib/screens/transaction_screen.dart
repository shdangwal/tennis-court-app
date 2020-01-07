import 'dart:ui';

import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  static const String id = '/transactions_screen';

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tennis Court'),
      ),
      body: Center(
        child: Text('Transaction Screen'),
      ),
    );
  }
}