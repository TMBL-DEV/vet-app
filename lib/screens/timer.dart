import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Nieuwe Timer"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                icon: new Icon(Icons.label),
                labelText: "Timer naam",
              ),
              obscureText: true,
              onSaved: (String value) {},
            ),
          ],
        ),
      ),
    );
  }
}
