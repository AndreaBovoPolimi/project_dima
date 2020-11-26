import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/views/profile_page.dart';
import 'package:good_air/views/settings_page.dart';
import 'package:good_air/views/trackme_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_page.dart';
import 'map_page.dart';

class MainPage extends StatefulWidget {
  State<MainPage> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  static var userLocation;
  String appBarText = "Home";
  int selectedIndex = 0;
  var home = HomePage();
  var map;
  var track = TrackMePage();
  var profile = ProfilePage();
  var settings = SettingsPage();
  StatefulWidget currentWidget;
  MainPageState() {
    currentWidget = home;
    loadUserPosition();
    map = MapPage();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        appBarText = "Home";
        currentWidget = home;
      } else if (index == 1) {
        appBarText = "Map";
        currentWidget = map;
      } else if (index == 2) {
        appBarText = "TrackMe";
        currentWidget = track;
      } else if (index == 3) {
        appBarText = "Profile";
        currentWidget = profile;
      } else {
        appBarText = "Settings";
        currentWidget = settings;
      }
    });
  }

  Future<void> loadUserPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    userLocation = LatLng(position.latitude, position.longitude);
  }

  Widget build(BuildContext context) {
    loadUserPosition();
    return Scaffold(
        //floatingActionButton: floatingButton,
        //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        appBar: AppBar(title: Text(appBarText)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onTap: onItemTapped,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
              ),
              label: 'TrackMe',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.amber[800],
        ),
        body: Column(children: [
          currentWidget,
        ]));
  }
}
