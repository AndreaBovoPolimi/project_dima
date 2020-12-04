import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/helpers/color_aqi.dart';
import 'package:good_air/models/info_feed.dart';
import 'package:good_air/services/aqicn.dart';
import 'package:good_air/sqlite/db_helper.dart';
import 'package:good_air/sqlite/entities/forecast.dart';
import 'package:good_air/views/sub_views/forecast_subpage.dart';
import 'package:good_air/views/sub_views/search_forecast_page.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key key}) : super(key: key);
  State<ForecastPage> createState() {
    return ForecastPageState();
  }
}

class ForecastPageState extends State<ForecastPage> {
  Widget _body = Center(child: CircularProgressIndicator()); // Default Body
  DbHelper helper = DbHelper();

  ForecastPageState() {
    _goToSecondPart();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Future _goToSecondPart() async {
    int count;
    InfoFeed infoFeedPosition;
    List<InfoFeed> infoFeedList = List<InfoFeed>();
    List<ForecastEntity> forecastList = List<ForecastEntity>();
    var todosFuture = await helper.getForecast();
    count = todosFuture.length;
    for (int i = 0; i < count; i++) {
      forecastList.add(ForecastEntity.fromObject(todosFuture[i]));
      infoFeedList.add(await getInfoFeed(
          ForecastEntity.fromObject(todosFuture[i]).lat,
          ForecastEntity.fromObject(todosFuture[i]).lng));
    }
    var position = await Geolocator.getCurrentPosition();
    infoFeedPosition = await getInfoFeed(position.latitude, position.longitude);
    setState(() => _body =
        ForecastPageSecond(infoFeedPosition, infoFeedList, forecastList));
  }
}

class ForecastPageSecond extends StatefulWidget {
  List<InfoFeed> infoFeedList;
  List<ForecastEntity> forecastList;
  InfoFeed infoFeedPosition;

  ForecastPageSecond(InfoFeed _infoFeedPosition, List<InfoFeed> _infoFeedList,
      List<ForecastEntity> _forecastList) {
    infoFeedList = _infoFeedList;
    infoFeedPosition = _infoFeedPosition;
    forecastList = _forecastList;
  }
  State<ForecastPageSecond> createState() {
    return ForecastPageSecondState(
        infoFeedPosition, infoFeedList, forecastList);
  }
}

class ForecastPageSecondState extends State<ForecastPageSecond> {
  DbHelper helper = DbHelper();
  List<ForecastEntity> forecastList;
  InfoFeed infoFeedPosition;
  List<InfoFeed> infoFeedList;
  int count;
  bool hasToUpdate = false;

  ForecastPageSecondState(InfoFeed _infoFeedPosition,
      List<InfoFeed> _infoFeedList, List<ForecastEntity> _forecastList) {
    infoFeedList = _infoFeedList;
    infoFeedPosition = _infoFeedPosition;
    forecastList = _forecastList;
    count = _forecastList.length;
  }

  Widget build(BuildContext context) {
    /*if (hasToUpdate) {
      return ForecastPage();
    }*/
    Widget _buildRowOnLocation() {
      return ListTile(
        leading: CircleAvatar(
          child: Text('${infoFeedPosition.data.aqi}'),
          backgroundColor: getColorAqi(infoFeedPosition.data.aqi),
        ),
        title: Row(children: [
          Text(
            'Your position',
            style: TextStyle(fontSize: 17.0),
          ),
          Icon(
            Icons.location_on_outlined,
            color: Colors.blue,
          )
        ]),
        //subtitle: Text(''),
        trailing: Icon(Icons.arrow_forward_outlined),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ForecastSubPage(getColorAqi(infoFeedPosition.data.aqi),infoFeedPosition.data.city.name,infoFeedPosition.data.aqi)));
        },
      );
    }

    Widget _buildRowOnUpdate() {
      return Opacity(
          opacity: 0.5,
          child: ListTile(
            leading: CircleAvatar(
              child: Text('?'),
              backgroundColor: Colors.blue,
            ),
            title: Text(
              '${forecastList[forecastList.length - 1].address}',
              style: TextStyle(fontSize: 17.0),
            ),
            //subtitle: Text(''),
            trailing: CircularProgressIndicator(),
            /*onTap: () {
          Navigator.push(context, route);
        },*/
          ));
    }

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('${infoFeedList[idx].data.aqi}'),
          backgroundColor: getColorAqi(infoFeedList[idx].data.aqi),
        ),
        title: Text(
          '${forecastList[idx].address}',
          style: TextStyle(fontSize: 17.0),
        ),
        //subtitle: Text('${forecastList[idx].lat}, ${forecastList[idx].lng}'),
        trailing: Icon(Icons.arrow_forward_outlined),
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => ForecastSubPage(getColorAqi(infoFeedList[idx].data.aqi),forecastList[idx].address,infoFeedList[idx].data.aqi)));
        },
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
                    if (hasToUpdate == true && i == forecastList.length) {
                      return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (DismissDirection direction) async {
                            await _removeForecast(i - 1);
                            setState(() {});
                          },
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete_outline),
                            alignment: Alignment.centerLeft,
                          ),
                          child: _buildRowOnUpdate());
                    }
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (DismissDirection direction) async {
                        await _removeForecast(i - 1);
                        setState(() {
                          forecastList.removeAt(i - 1);
                          infoFeedList.removeAt(i - 1);
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
    var _return = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchForecastPage(forecastList)),
    );
    if (_return != null) {
      forecastList.add(_return);
      _addNewInfoFeed(_return);
      setState(() {
        hasToUpdate = true;
      });
    }
  }

  Future _addNewInfoFeed(ForecastEntity forecast) async {
    infoFeedList.add(await getInfoFeed(forecast.lat, forecast.lng));
    setState(() {
      hasToUpdate = false;
    });
  }

  Future _removeForecast(int index) async {
    var id = forecastList[index].id;
    await helper.deleteForecast(id);
  }
}
