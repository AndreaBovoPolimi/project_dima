import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key key}) : super(key: key);
  State<RankingPage> createState() {
    return RankingPageState();
  }
}

class RankingPageState extends State<RankingPage> {
  Widget build(BuildContext context) {
    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('${idx + 100}'),
        ),
        title: Text(
          'Item $idx',
          style: TextStyle(fontSize: 17.0),
        ),
        trailing: Icon(Icons.add_to_home_screen_outlined),
        /*onTap: () {
          Navigator.push(context, route);
        },*/
      );
    }

    return ListView.builder(
        itemCount: 20,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return Divider();
          return _buildRow(i);
        });
  }
}
