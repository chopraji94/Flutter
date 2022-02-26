import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My app",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: new Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}