import 'package:custom_drawer/drawer/drawer-widget.dart';
import 'package:flutter/material.dart';

import 'home/home-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Drawer',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}