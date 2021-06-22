import 'package:flutter/material.dart';
import 'package:vetApp/screens/home.dart';
import 'package:vetApp/screens/timer.dart';
import 'package:vetApp/screens/vetjes/create.dart';
import 'package:vetApp/screens/vetjes/vetjes.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/home",
      routes: {
        // "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/vetjes": (context) => Vetjes(),
        "/vetjes/create": (context) => CreateVetje(),
        "/timer": (context) => Timer(),
      },
    ));
