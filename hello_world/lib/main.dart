import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MaterialApp(
      home: new MyHomePage(),
      theme: new ThemeData(
          primarySwatch: Colors.teal, brightness: Brightness.light),
    ));

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url = "https://swapi.dev/api/people";
  late List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await
        http.get(Uri.parse(url), headers: {"Accept": "application/json"});
      print(response.body);

    setState(() {
      var convertData = json.decode(response.body);
      data = convertData['results'];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Json Get By Fetch'),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, int index) {
            return new Container(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      padding: EdgeInsets.all(8.0),
                      child: new Text(data[index]['name']),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
