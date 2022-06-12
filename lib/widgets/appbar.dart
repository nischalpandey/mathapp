import 'package:flutter/material.dart';

class Myappbar extends StatefulWidget {
  const Myappbar({Key? key}) : super(key: key);

  @override
  State<Myappbar> createState() => _MyappbarState();
}

class _MyappbarState extends State<Myappbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Mero Math"),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
