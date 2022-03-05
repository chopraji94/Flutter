import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chat App',
      home: new ChatApp(),
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
        accentColor: Colors.pinkAccent
      ),
    );
  }
}