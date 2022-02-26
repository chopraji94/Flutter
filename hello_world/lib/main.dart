import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  String myText = "Hello World";

  void _changeText(){
    setState(() {
      if(myText.startsWith("H")){
        myText = "Welcome to my app";
      }
      else{
        myText = "Hello World";
      }
    });
  }

  Widget _bodyWidget(){
  return new Container(
    padding: const EdgeInsets.all(8.0),
    child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              myText,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 30.0
              ),
            ),
            new ElevatedButton(
              onPressed: _changeText,
              child: Text("Click Button"),
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.amber)
               ),
              ),
          ],
        ),
      ),
  );
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Home Page"),
      ),
      body: _bodyWidget(),
    );
  }
}