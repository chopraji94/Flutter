import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/new_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.amber, brightness: Brightness.light),
      home: new HomePage(),
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => new NewPage("New Page"),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Drawer App'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: new Container(
        child: new Center(
          child: new Text('Home Page'),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Pranav Chopra'),
              accountEmail: new Text('Chopraji94@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.black, child: new Text('P')),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                    backgroundColor: Colors.black, child: new Text('C')),
              ],
            ),
            new ListTile(
                title: new Text('Page One'),
                trailing: new Icon(Icons.arrow_upward),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NewPage('Page One')))
                },
            ),
            new ListTile(
              title: new Text('Page two'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () => {
                Navigator.of(context).pop(),
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NewPage('Page two')))
              },
            ),
            new Divider(height: 10.0),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
