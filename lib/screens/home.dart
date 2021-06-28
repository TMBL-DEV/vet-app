import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
