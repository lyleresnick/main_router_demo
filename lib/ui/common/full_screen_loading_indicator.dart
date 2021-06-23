import 'package:flutter/material.dart';

class FullScreenLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black26,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
