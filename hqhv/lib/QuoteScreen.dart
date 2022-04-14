import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'dart:async';

class QuoteScreen extends StatefulWidget {
  QuoteScreen();

  @override
  QuoteScreenState createState() => QuoteScreenState("Quotes");

}



class QuoteScreenState extends State<QuoteScreen> {
  
  Timer ? timer;
  int randomNumber = Random().nextInt(2)+1;
  
  final String documentId;

  QuoteScreenState(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Quotes');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data['$randomNumber']}");
        }

        return Text("loading");
      },
    );
  }


}
