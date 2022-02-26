import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyAppHome(),
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        accentColor: Colors.red
      ),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppHomeState createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {

  String text = "Title for this app";
  int i=0;

  void _changeText(){
    setState(() {
      text = "Text is changed for"+ " " + "$i" + " time";
      i++;
    });
  }
  
  Widget _homeapp(){
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _floatingButton(){
    return new FloatingActionButton(
       child: new Icon(Icons.add),
        onPressed: _changeText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("My Home App"),
      ),
      body: _homeapp(),
      floatingActionButton: _floatingButton()
    );
  }
}