import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:court_app/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_app/screens/login_screen.dart';
import 'package:intl/intl.dart';

final _firestore = Firestore.instance;

class PendingScreen extends StatefulWidget {
  static const String id = '/pending_screen';
  @override
  _PendingScreenState createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  void initState() {
    super.initState();
    
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if(user != null) {
        loggedInUser = user;
      } else {
        Navigator.pushNamed(context, LoginScreen.id);
      }
    } catch(e) {
        print(e);
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pending Fees'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: PendingsStream(),
            ),
          ],
        )
      );
  }
}

class PendingsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('transactions').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightGreenAccent,
            ),
          );
        }
        final transactions = snapshot.data.documents.reversed;
        List<PendingBubble> pendingBubbles = [];
        int index = 1;
        try {
        for (var transaction in transactions) {
          final String transactionName = transaction.data['name'];
          final transactionToDate = transaction.data['to_date'];

          final pendingBubble = PendingBubble(
            id: index,
            name: transactionName,
            to_date: transactionToDate,
          );
          DateTime to = transaction.data['to_date'].toDate();
          DateTime now = DateTime.now();
          if(now.isAfter(to)){
            index++;
            pendingBubbles.add(pendingBubble);
          } 
        }
        } catch(e) {
          print(e);
        }
        return ListView(
            children: pendingBubbles,
          );
      },
    );
  }
}

class PendingBubble extends StatelessWidget {
  PendingBubble({this.name, this.to_date, this.id});
  // StudentBubble({this.name});
  final String name;
  final to_date;
  final int id;
  @override
  Widget build(BuildContext context) {
    DateTime to = to_date.toDate();
    String toDate = DateFormat('dd-MM-yyyy').format(to);
    return ListTile(
      leading: Text('$id',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text('$name'),
      subtitle: Text('Valid upto: $toDate'),
    );
  }
}