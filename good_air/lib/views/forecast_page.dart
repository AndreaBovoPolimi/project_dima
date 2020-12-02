import 'package:flutter/material.dart';
import 'package:good_air/models/info_feed.dart';
import 'package:good_air/sqlite/db_helper.dart';
import 'package:good_air/sqlite/entities/forecast.dart';
import 'package:good_air/views/sub_views/search_forecast_page.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key key}) : super(key: key);
  State<ForecastPage> createState() {
    return ForecastPageState();
  }
}

class ForecastPageState extends State<ForecastPage> {
  DbHelper helper = DbHelper();
  List<ForecastEntity> forecastList;
  InfoFeed infoFeedPosition;
  List<InfoFeed> infoFeedList;
  int count = 0;

  Widget build(BuildContext context) {
    if (forecastList == null) {
      forecastList = List<ForecastEntity>();
      getData();
    }

    Widget _buildRowOnLocation() {
      return ListTile(
        leading: CircleAvatar(
          child: Text('1'),
        ),
        title: Row(children: [
          Text(
            'Your position',
            style: TextStyle(fontSize: 17.0),
          ),
          Icon(
            Icons.location_on_outlined,
            color: Colors.blueGrey,
          )
        ]),
        //subtitle: Text(''),
        trailing: Icon(Icons.arrow_forward_outlined),
        /*onTap: () {
          Navigator.push(context, route);
        },*/
      );
    }

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('${forecastList[idx].id}'),
        ),
        title: Text(
          '${forecastList[idx].address}',
          style: TextStyle(fontSize: 17.0),
        ),
        subtitle: Text('${forecastList[idx].lat}, ${forecastList[idx].lng}'),
        trailing: Icon(Icons.arrow_forward_outlined),
        /*onTap: () {
          Navigator.push(context, route);
        },*/
      );
    }

    return Stack(children: [
      Expanded(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              //width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: forecastList.length + 1,
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  itemBuilder: (BuildContext context, int i) {
                    if (i == 0) {
                      return _buildRowOnLocation();
                    }
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (DismissDirection direction) async {
                        await _removeForecast(i - 1);
                        setState(() {
                          getData();
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete_outline),
                        alignment: Alignment.centerLeft,
                      ),
                      child: _buildRow(i - 1),
                    );
                  }))),
      Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              _awaitFinishNextScreen();
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            heroTag: "addForecast",
          )),
    ]);
  }

  void _awaitFinishNextScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchForecastPage(forecastList)),
    );
    setState(() {
      getData();
    });
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getForecast();
      todosFuture.then((result) {
        List<ForecastEntity> _forecastList = List<ForecastEntity>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          _forecastList.add(ForecastEntity.fromObject(result[i]));
        }
        setState(() {
          forecastList = _forecastList;
          count = count;
        });
      });
    });
  }

  Future _removeForecast(int index) async {
    var id = forecastList[index].id;
    await helper.deleteForecast(id);
  }
}
