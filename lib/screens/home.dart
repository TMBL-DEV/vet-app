import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    var routes = ["/home", "/vetjes"];
    void onTabTapped(index) {
      if (currentIndex != index) {
        Navigator.pushNamed(context, routes[index]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.green[800],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Center(
                child: Text(
              "Welkom bij vet app",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 28,
              ),
            )),
            SizedBox(height: 10.0),
            Center(child: Wander())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.food_bank),
            label: "Vetjes",
          ),
        ],
      ),
    );
  }
}

class Wander extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("hoi"), Text("wander")],
    );
  }
}
