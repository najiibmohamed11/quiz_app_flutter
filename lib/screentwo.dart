import 'package:flutter/material.dart';

class Screentwo extends StatelessWidget {
  const Screentwo(
      {Key? key, required this.rightquestion, required this.wrongquestions})
      : super(key: key);
  final int rightquestion;
  final int wrongquestions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text('$rightquestion'), Text('$wrongquestions')]),
    );
  }
}
