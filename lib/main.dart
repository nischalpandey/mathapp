import 'Screens/home.dart';
import 'package:flutter/material.dart';
import 'Screens/contact.dart';
import 'Screens/subscribe.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      // ignore: prefer_const_constructors

      routes: {
        "/": (context) => Contact(),
        "/contact": (context) => Contact(),
        "/sub": (context) => Sub(),
      },
    );
  }
}
