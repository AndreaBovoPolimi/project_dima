import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/helpers/color_aqi.dart';
import 'package:good_air/models/info_ranking.dart';
import 'package:good_air/services/aqicn.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key key}) : super(key: key);
  State<RankingPage> createState() {
    return RankingPageState();
  }
}

class RankingPageState extends State<RankingPage> {
  Widget _body = Center(child: CircularProgressIndicator()); // Default Body

  RankingPageState() {
    _goToSecondPart();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  void _goToSecondPart() async {
    await new Future.delayed(const Duration(seconds: 1));
    Position position = await Geolocator.getCurrentPosition();
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude));
    InfoRanking infoRanking = await getInfoRanking(addresses.first.countryCode);
    setState(() => _body = RankingSecondPage(infoRanking));
  }
}

class RankingSecondPage extends StatefulWidget {
  InfoRanking infoRanking;
  RankingSecondPage(InfoRanking infoRanking) {
    this.infoRanking = infoRanking;
  }
  State<RankingSecondPage> createState() {
    return RankingSecondPageState(infoRanking);
  }
}

class RankingSecondPageState extends State<RankingSecondPage> {
  InfoRanking infoRanking;
  RankingSecondPageState(InfoRanking infoRanking) {
    this.infoRanking = infoRanking;
  }

  Widget build(BuildContext context) {
    Widget _buildRow(Cities idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('${idx.station.a}'),
          backgroundColor: getColorAqi(int.tryParse(idx.station.a)),
        ),
        title: Text(
          '${idx.city}',
          style: TextStyle(fontSize: 17.0),
        ),
        trailing: Icon(Icons.add_to_home_screen_outlined),
        /*onTap: () {
           Navigator.push(context, route);
         },*/
      );
    }

    return ListView.builder(
        itemCount: infoRanking.cities.length * 2,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return Divider();
          int index = i ~/ 2;
          return _buildRow(infoRanking.cities[index]);
        });
  }
}
