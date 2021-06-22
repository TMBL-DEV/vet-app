import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vetjes extends StatefulWidget {
  @override
  _VetjesState createState() => _VetjesState();
}

class _VetjesState extends State<Vetjes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("vetjes"),
        backgroundColor: Colors.green[800],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Center(
                child: Text(
              "All uw vetjes om te frituren",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 28,
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/vetjes/create");
        },
        child: new Icon(Icons.add),
        backgroundColor: Colors.green[800],
      ),
    );
  }
}
