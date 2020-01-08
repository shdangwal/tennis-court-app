import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:court_app/widgets/widget.dart';
import 'package:court_app/screens/add_transactions_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_app/screens/login_screen.dart';
import 'package:intl/intl.dart';

final _firestore = Firestore.instance;

class TransactionScreen extends StatefulWidget {
  static const String id = '/transactions_screen';

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
          title: Text('All Transactions'),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     showModalBottomSheet(
        //       isScrollControlled: true,
        //       context: context, 
        //       builder: (context) => Padding(
        //         padding: EdgeInsets.only(top: 50),
        //         child: AddTransactionScreen(),
        //       ),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.vertical(
        //           top:Radius.circular(60.0)
        //         )
        //       ),
        //     );
        //   },
        //   child: Icon(Icons.add),
        // ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: TransactionsStream(),
            ),
          ],
        )
      );
    }
}

class TransactionsStream extends StatelessWidget {
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
        List<TransactionBubble> transactionBubbles = [];
        int index = 1;
        try {
        for (var transaction in transactions) {
          final String transactionName = transaction.data['name'];
          final int transactionAmt = int.parse(transaction.data['amt'].toString());
          final transactionFromTime = transaction.data['from_date'];
          final transactionToTime = transaction.data['to_date'];

          final transactionBubble = TransactionBubble(
            id: index,
            name: transactionName,
            amt: transactionAmt,
            from_date: transactionFromTime,
            to_date: transactionToTime,
          );
          index++;
          transactionBubbles.add(transactionBubble);
        }
        } catch(e) {
          print(e);
        }
        return ListView(
            children: transactionBubbles,
          );
      },
    );
  }
}

class TransactionBubble extends StatelessWidget {
  TransactionBubble({this.name, this.amt, this.from_date, this.to_date, this.id});
  final String name;
  final int amt;
  final from_date;
  final to_date;
  final int id;

  @override
  Widget build(BuildContext context) {
    DateTime from = from_date.toDate();
    DateTime to = to_date.toDate();
    String toDate = DateFormat('dd-MM-yyyy').format(to);
    String fromDate = DateFormat('dd-MM-yyyy').format(from);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$id',
                  style: TextStyle(
                    fontSize: 18, 
                  ),
                ),
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$amt',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'From: $fromDate',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'To: $toDate',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}