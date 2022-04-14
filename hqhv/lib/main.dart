import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hqhv/QuoteScreen.dart';
import 'dart:ui';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(child : QuoteScreen())
      ),
    );
  }
}
