import 'package:flutter/material.dart';
import 'package:main_router_demo/ui/main_router/assembly/main_router_assembly.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'iTunes Tracks',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: MainRouterAssembly().scene);
  }
}
