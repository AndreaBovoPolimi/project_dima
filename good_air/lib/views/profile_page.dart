import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  State<ProfilePage> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.deepOrange,
      child: Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              //
            },
            child: Icon(Icons.settings),
            backgroundColor: Colors.blue,
            heroTag: "settings",
          )),
    ));
  }
}
