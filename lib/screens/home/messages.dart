import 'package:flutter/material.dart';
import 'appBar.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        backgroundColor: Color(0xff0f0f0f),
        context: context,
        view: 3,
      ),
    );
  }
}
