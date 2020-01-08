import 'package:flutter/material.dart';
import 'package:court_app/screens/pending_screen.dart';
import 'package:court_app/screens/student_screen.dart';
import 'package:court_app/screens/transaction_screen.dart';
import 'package:court_app/screens/welcome_screen.dart';
import 'package:court_app/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Court App',
      theme: ThemeData(
        primaryColor: Color(0xFF009688),
        accentColor: Colors.brown,
        primaryColorDark: Color(0xFF00796B),
        dividerColor: Color(0xFFBDBDBD),
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xFF212121)),
          body2: TextStyle(color: Color(0xFF757575)),
        ),
        iconTheme: IconThemeData(
          color: Colors.brown,
        ),
      ),
      // home: PendingScreen(),
      initialRoute: LoginScreen.id,
      routes: {
        PendingScreen.id: (BuildContext context) => PendingScreen(),
        TransactionScreen.id: (BuildContext context) => TransactionScreen(),
        StudentScreen.id: (BuildContext context) => StudentScreen(),
        WelcomeScreen.id: (BuildContext context) => WelcomeScreen(),
        LoginScreen.id: (BuildContext context) => LoginScreen(),
      },
    );
  }
}

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int counter = 0;
//   void incrementCounter() {
//     setState(() {
//       counter++;
//       print("abc");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tennis Court'),
//       ),
//       body: Center(
//         child: Text('Number of times button pressed=$counter'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: incrementCounter,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class MainStatefulWidget extends StatefulWidget {
//   MainStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MainStatefulWidgetState createState() => _MainStatefulWidgetState();
// }

// class _MainStatefulWidgetState extends State<MainStatefulWidget> {
//   int _selectedIndex = 1;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Students',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Pending',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Transactions',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.face),
//             title: Text('Students'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.error_outline),
//             title: Text('Pending'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.view_list),
//             title: Text('Transactions'),
//           )
//         ],
//         currentIndex: _selectedIndex,
//         //selectedItemColor: Colors.tealAccent[300],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
