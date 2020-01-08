import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:court_app/widgets/widget.dart';
import 'package:court_app/screens/add_student_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:court_app/screens/login_screen.dart';
import 'package:court_app/screens/add_transactions_screen.dart';

final _firestore = Firestore.instance;
const textHeaderStyle = TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            );
const textSubHeadingStyle = TextStyle(
              fontSize: 18,
            );

class StudentScreen extends StatefulWidget {
  static const String id = '/students_screen';

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
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
          title: Text('Students'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context, 
              builder: (context) => Padding(
                padding: EdgeInsets.only(top: 50),
                child: AddStudentScreen(),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top:Radius.circular(60.0))),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StudentsStream(),
            ),
          ],
        )
      );
  }
}

class StudentsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('students').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightGreenAccent,
            ),
          );
        }
        final students = snapshot.data.documents.reversed;
        List<StudentBubble> studentBubbles = [];
        int index = 1;
        try {
        for (var student in students) {
          final String studentName = student.data['name'];
          final int studentPhone = int.parse(student.data['phone'].toString());

          final studentBubble = StudentBubble(
            id: index,
            name: studentName,
            phone: studentPhone,
          );
          index++;
          studentBubbles.add(studentBubble);
        }
        } catch(e) {
          print(e);
        }
        return ListView(
            children: studentBubbles,
          );
      },
    );
  }
}

class StudentBubble extends StatelessWidget {
  StudentBubble({this.name, this.phone, this.id});
  // StudentBubble({this.name});
  final String name;
  final int phone;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, 
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: AddTransactionScreen(name),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top:Radius.circular(60.0)
                    )
                  ),
                );
              },
              child: Card(
          child: ListTile(
            title: Text('$id. $name',
              style: textHeaderStyle,
            ),
            trailing: Text('$phone',
              style: textSubHeadingStyle,
            ),  
          ),
          
        ),
      ),
    );
  }
}