import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/views/profile_page.dart';
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
  MapPage map;
  static var userLocation;

  Future<void> loadUserPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    userLocation = LatLng(position.latitude, position.longitude);
  }

  MainPageState() {
    loadUserPosition();
    map = MapPage();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NewsPage(),
      map,
      ProfilePage(),
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.format_align_left_outlined), label: 'News'),
      BottomNavigationBarItem(
          icon: Icon(Icons.outlined_flag_outlined), label: 'Maps'),
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
        title: Text(
          _kBottomNavBarItems[_currentTabIndex].label,
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        _kTabPages[_currentTabIndex],
      ]),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
