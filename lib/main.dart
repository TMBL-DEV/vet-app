import 'package:flutter/material.dart';
import 'package:vetApp/models/User.dart';
import 'package:vetApp/services/auth.dart';
import 'package:vetApp/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(VetApp());

class VetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
