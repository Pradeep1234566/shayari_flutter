import 'package:flutter/material.dart';
import 'package:shayari/pages/home_page.dart';


void main() {
  runApp(ShayariApp());
}

class ShayariApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
