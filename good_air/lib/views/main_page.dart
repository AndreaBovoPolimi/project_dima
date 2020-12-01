import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/views/forecast_page.dart';
import 'package:good_air/views/profile_page.dart';
import 'package:good_air/views/ranking_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'news_page.dart';
import 'map_page.dart';

class MainPage extends StatefulWidget {
  State<MainPage> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _currentTabIndex = 0;
  static var userLocation;

  Future<void> loadUserPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    userLocation = LatLng(position.latitude, position.longitude);
  }

  MainPageState() {
    loadUserPosition();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NewsPage(),
      RankingPage(),
      MapPage(),
      ForecastPage(),
      ProfilePage(),
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.format_align_left_outlined), label: 'News'),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined), label: 'Ranking'),
      BottomNavigationBarItem(
          icon: Icon(Icons.outlined_flag_outlined), label: 'Maps'),
      BottomNavigationBarItem(
          icon: Icon(Icons.wallpaper_outlined), label: 'Forecast'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
    ];
    assert(_kTabPages.length == _kBottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Row(children: [
          Text('Air', style: TextStyle(color: Colors.blueGrey)),
          Text(
            _kBottomNavBarItems[_currentTabIndex].label,
            style: TextStyle(color: Colors.blueAccent),
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: IndexedStack(children: _kTabPages, index: _currentTabIndex),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
