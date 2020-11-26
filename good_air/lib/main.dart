import 'package:flutter/material.dart';
import 'package:good_air/views/main_page.dart';

void main() {
  runApp(Material());
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodAir_',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
