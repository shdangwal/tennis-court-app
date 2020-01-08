import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:court_app/widgets/widget.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddTransactionScreen extends StatefulWidget {
  
  AddTransactionScreen(this.userName);
  final String userName;

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState(this.userName);
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String userName;
  _AddTransactionScreenState(this.userName);
  final _firestore = Firestore.instance;
  String name;
  String from;
  String to;
  int amt;
  DateTime from_date;
  DateTime to_date;
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');

  Future<Null> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedFromDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedFromDate)
      setState(() {
        selectedFromDate = picked;
        from_date = selectedFromDate;
        from = formatter.format(selectedFromDate);
      });
  }

  Future<Null> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedToDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedToDate)
      setState(() {
        selectedToDate = picked;
        to_date = selectedToDate;
        to = formatter.format(selectedToDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(20),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Add Transaction & $userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF00796B),
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                onChanged: (value) {
                  name = name;
                },
                autofocus: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '$userName',
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                onChanged: (value) {
                  amt = int.parse(value);
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20,),
              Text('From Date'),
              RaisedButton(
                onPressed: () => _selectFromDate(context),
                child: Text('$from'),
              ),
              SizedBox(height: 10,),
              Text('To Date'),
              RaisedButton(
                onPressed: () => _selectToDate(context),
                child: Text('$to'),
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
                  if(name != null && amt != null && from_date != null && to_date != null) {
                  _firestore.collection('transactions').add({
                    'name': userName,
                    'amt': amt,
                    'from_date': from_date,
                    'to_date': to_date,
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
