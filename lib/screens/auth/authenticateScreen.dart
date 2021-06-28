import 'package:flutter/material.dart';
import 'package:vetApp/screens/auth/login.dart';
import 'package:vetApp/screens/auth/signup.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  int _selectedIndex = 0;
  String title = "oi";

  static List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: new Icon(Icons.app_registration), label: "Register"),
    BottomNavigationBarItem(
        icon: new Icon(Icons.app_registration), label: "Login"),
  ];

  static List<Widget> _widgets = [SignUp(), Login()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      this.title = _AuthenticateScreenState._items[this._selectedIndex].label;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.green[800],
      ),
      body: _widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: this._selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
