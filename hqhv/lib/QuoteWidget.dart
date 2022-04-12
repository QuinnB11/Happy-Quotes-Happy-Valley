import 'package:flutter/material.dart';



class QuoteWidget extends StatelessWidget {
  @required final String quote;


  const QuoteWidget({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 114, 155, 227),
    );
  }
}