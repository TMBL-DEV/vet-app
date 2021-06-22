import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String name;
  CustomAppBar(this.name);

  @override
  _CustomAppBarState createState() => _CustomAppBarState(this.name);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final String name;
  _CustomAppBarState(this.name);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.name),
    );
  }
}
