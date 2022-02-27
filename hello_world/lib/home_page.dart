import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0;
  var sum = 0;
  double division = 0.0;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSubtraction() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMultiplication() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDivision() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  void ClearField1() {
    t1.text = "";
  }

  void ClearField2() {
    t2.text = "";
  }

  Widget AppWidget() {
    return new Container(
      padding: const EdgeInsets.all(40.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output : " + "$sum",
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter number 1"),
              controller: t1,
              onTap: ClearField1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter number 2"),
              controller: t2,
              onTap: ClearField2,
            ),
            new Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                    onPressed: doAddition,
                    color: Colors.greenAccent,
                    child: Text("+")),
                new MaterialButton(
                    onPressed: doSubtraction,
                    color: Colors.greenAccent,
                    child: Text("-"))
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 5.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                    onPressed: doDivision,
                    color: Colors.greenAccent,
                    child: Text("/")),
                new MaterialButton(
                    onPressed: doMultiplication,
                    color: Colors.greenAccent,
                    child: Text("*")),
              ],
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
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: AppWidget());
  }
}
