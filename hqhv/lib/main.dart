import 'package:flutter/material.dart';
import 'package:hqhv/QuoteWidget.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: QuoteWidget(
          quote: "Its a test"
        )
      ),
    );
  }
}
