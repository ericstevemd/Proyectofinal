import 'package:flutter/material.dart';
import 'package:fron_cliente/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: login(),
      ),
    );
  }
}
