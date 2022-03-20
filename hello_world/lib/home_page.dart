import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final List currencies;
  MyHomePage(this.currencies);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Crypto App'),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 0.5
      ),
      body: cryptoWidget(),
    );
  }

  Widget cryptoWidget() {
    return new Container(
      child: Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
                itemCount: widget.currencies.length,
                itemBuilder: (context, int index) {
                  final Map currency = widget.currencies[index];
                  final MaterialColor color = _colors[index % _colors.length];
                  return _getListItemUI(currency, color);
                }),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0]),
      ),
      title: new Text(
        currency['name'],
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubTitleText(currency['quote']['USD']['price'].toString(),
          currency['quote']['USD']['percent_change_1h'].toString()),
      isThreeLine: true,
    );
  }

  Widget _getSubTitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour -: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }
}
