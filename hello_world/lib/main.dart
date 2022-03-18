import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
    home: new HomePage(),
    theme: new ThemeData(
        primarySwatch: Colors.teal, brightness: Brightness.light)));

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Load Json App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name : " + data[index]["name"]),
                        new Text("Age : " + data[index]["age"]),
                        new Text("Gender : " + data[index]["gender"]),
                        new Text("Hair Color : " + data[index]["hair_color"]),
                      ],
                    ),
                  );
                },
                itemCount: data == null ? 0 : data.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
