import 'package:flutter/material.dart';
import 'package:vetApp/screens/auth/profile.dart';
import 'package:vetApp/screens/home.dart';
import 'package:vetApp/screens/timer.dart';
import 'package:vetApp/screens/vetjes/create.dart';
import 'package:vetApp/screens/vetjes/vetjes.dart';

class DefaultScreen extends StatefulWidget {
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  int _selectedIndex = 0;
  String title = "Vetapp";

  static List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: new Icon(Icons.house), label: "Home"),
    BottomNavigationBarItem(icon: new Icon(Icons.food_bank), label: "Vetjes"),
    BottomNavigationBarItem(
        icon: new Icon(Icons.account_box), label: "Profile"),
  ];

  static List<Widget> _widgets = [Home(), Vetjes(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      this.title = _DefaultScreenState._items[this._selectedIndex].label;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FloatingActionButton> _buttons = [
      FloatingActionButton(
        child: const Icon(Icons.timer),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Timer();
          }));
        },
      ),
      FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateVetje();
          }));
        },
      ),
      null,
    ];

    FloatingActionButton button() {
      if (_buttons[_selectedIndex] != null) {
        return _buttons[_selectedIndex];
      }
    }

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
      floatingActionButton: button(),
    );
  }
}
