import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  Widget build(BuildContext context) {
    return Expanded(child: Container(color: Colors.pinkAccent,));

  }
}