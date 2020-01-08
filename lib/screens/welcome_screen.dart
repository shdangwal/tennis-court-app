import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:court_app/screens/pending_screen.dart';
import 'package:court_app/screens/student_screen.dart';
import 'package:court_app/screens/transaction_screen.dart';
import 'package:court_app/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        title: Text('Tennis Court'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.id,(Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Options'),
            ),
            ListTile(
              leading: Icon(Icons.face),
              title: Text('Students'),
              onTap: () {
                Navigator.pushNamed(context, StudentScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Transactions'),
              onTap: () {
                Navigator.pushNamed(context, TransactionScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.error_outline),
              title: Text('Pending'),
              onTap: () {
                Navigator.pushNamed(context, PendingScreen.id);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome Screen'),
      ),
    );
  }
}
