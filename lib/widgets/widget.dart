import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class StudentList extends StatefulWidget {
//   List<DocumentSnapshot> studentInfo;
//   StudentList({this.studentInfo});
//   @override
//   _StudentListState createState() => _StudentListState();
// }

// class _StudentListState extends State<StudentList> {

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         for(var student in students) {
//           StudentTile(studentName: student.data['name'], studentPhone: student.data['phone']),
//         },
//         StudentsTile(),
//         StudentsTile(),
//         StudentsTile(),
//       ],
//     );
//   }
// }

// class StudentList extends StatelessWidget {
//   List<Text> studentNames;
//   List<Text> studentPhones;
//   List<DocumentSnapshot> studentInfo;
//   StudentList({this.studentInfo});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         for(var student in students) {
//           StudentTile(studentName: student.data['name'], studentPhone: student.data['phone']),
//         },
//         StudentsTile(),
//         StudentsTile(),
//         StudentsTile(),
//       ],
//     );
//   }
// }

// class StudentsTile extends StatelessWidget {
//   String studentName;
//   String studentPhone;

//   StudentTile({this.studentName, this.studentPhone});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text('Rajendra Dangwal'),
//       trailing: Text('9423178097'),
//     );
//   }
// }

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TransactionsTile(),
        TransactionsTile(),
        TransactionsTile(),
      ],
    );
  }
}

class TransactionsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Rajendra Dangwal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '5000',
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
                  'From: 20/10/2019',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'To: 4/01/2020',
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

class PendingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PendingTile(),
        PendingTile(),
        PendingTile(),
      ],
    );
  }
}

class PendingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Rajendra Dangwal'),
      subtitle: Text('Valid upto: 20/12/2019 16:21:23'),
    );
  }
}

class BasicDateField extends StatefulWidget {
  @override
  _BasicDateFieldState createState() => _BasicDateFieldState();
}

class _BasicDateFieldState extends State<BasicDateField> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _selectDate(context),
      child: Text('$selectedDate'),
    );
  }
}
