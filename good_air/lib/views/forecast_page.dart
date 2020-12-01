import 'package:flutter/material.dart';

class ForecastPage extends StatefulWidget {
  State<ForecastPage> createState() {
    return ForecastPageState();
  }
}

class ForecastPageState extends State<ForecastPage> {
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
        subtitle: Text('boia chen'),
        trailing: Icon(Icons.arrow_forward_outlined),
        /*onTap: () {
          Navigator.push(context, route);
        },*/
      );
    }

    return Stack(children: [
      ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) return Divider();
            return _buildRow(i);
          }),
      Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              //
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            heroTag: "settings",
          )),
    ]);
  }
}
