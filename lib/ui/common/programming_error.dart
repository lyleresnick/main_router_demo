import 'package:flutter/material.dart';

class ProgrammingError extends StatelessWidget {
  final String message;
  ProgrammingError(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Center(
            child: Text(message, style: TextStyle(color: Colors.yellow, fontSize: 24))));
  }
}
