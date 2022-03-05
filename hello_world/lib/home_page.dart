import 'package:flutter/material.dart';
import 'package:hello_world/chatscreen_page.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Frenzy Chat App"),
        centerTitle: true,
      ),
      body: new ChatScreen()
    );
  }
}