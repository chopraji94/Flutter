import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHomePage(_currencies),
      theme: new ThemeData(
          primarySwatch: Colors.pink, 
          brightness: Brightness.light,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null
        ),
    );
  }
}

Future<List> getCurrencies() async {
  String cryptoUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

  http.Response response = await http.get(Uri.parse(cryptoUrl),
      headers: {'X-CMC_PRO_API_KEY': '387e7cc1-01a8-4463-bb5e-26d9cf6b29ed'});
  var jsonData = json.decode(response.body);
  var onlyData = jsonData["data"] as List;
  return onlyData;
}
