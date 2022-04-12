import 'package:flutter/material.dart';
import 'package:hqhv/QuoteWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class QuoteScreen extends StatelessWidget {
  final Firestore _firestore = Firestore();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(

      ),
    );
  }
  



}

class _Loadingindicator extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(
        child: CircularProgressIndicator();
      );
    }
}