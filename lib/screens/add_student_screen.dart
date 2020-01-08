import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _firestore = Firestore.instance;
  String name;
  int phone;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(20),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Add Student',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF00796B),
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phone = int.parse(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                child: Text('Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Color(0xFF009688),
                onPressed: () {
                  if(name != null && phone != null) {
                  _firestore.collection('students').add({
                    'name': name,
                    'phone': phone,
                  });
                  Navigator.pop(context);
                  } else {
                    AlertDialog(
                      title: Text('Don\'t leave fields empty'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Regret'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  }
                },
              ),
              FlatButton(
                child: Text('Close',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Color(0xFF009664),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      );
  }
}


// class AddStudentScreen extends StatelessWidget {
//   String name;
//   String phone;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Padding(
//             padding: EdgeInsets.all(20),
//                   child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text('Add Student',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF00796B),
//                   fontSize: 30.0,
//                 ),
//               ),
//               SizedBox(height: 20,),
//               TextField(
//                 autofocus: true,
//                 keyboardType: TextInputType.text,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   name = value;
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Name',
//                 ),
//               ),
//               SizedBox(height: 20,),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   phone = value;
//                   print(phone);
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Phone',
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               FlatButton(
//                 child: Text('Add',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 color: Color(0xFF009688),
//                 onPressed: () {
//                   print(name);
//                   print(phone);
//                 },
//               ),
//               FlatButton(
//                 child: Text('Close',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 color: Color(0xFF009664),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         )
//       );
//   }
// }