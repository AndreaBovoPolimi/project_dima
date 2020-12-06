import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/views/forecast_page.dart';
import 'package:good_air/views/profile_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'news_page.dart';
import 'map_page.dart';
import 'package:workmanager/workmanager.dart';
import 'package:good_air/notifications/notification.dart' as notif;

const fetchBackground = "fetchBackground";

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    //Geolocator geoLocator = Geolocator()..forceAndroidLocationManager = true;
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    notif.Notification notification = new notif.Notification();
    notification.showNotification(userLocation);
    return Future.value(true);
  });
}

class MainPage extends StatefulWidget {
  State<MainPage> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _currentTabIndex = 0;
  static var userLocation;

  @override
  void initState() {
    super.initState();
    Workmanager.initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );

    Workmanager.registerPeriodicTask("1", fetchBackground,
        frequency: Duration(minutes: 30),
        constraints: Constraints(
            networkType: NetworkType.connected,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresDeviceIdle: false,
            requiresStorageNotLow: false));
  }

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
      NewsPage(key: PageStorageKey('News')),
      MapPage(key: PageStorageKey('Map')),
      ForecastPage(key: PageStorageKey('Forecast')),
      ProfilePage(key: PageStorageKey('Profile')),
    ];

    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.format_align_left_outlined), label: 'News'),
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
      body: IndexedStack(
        index: _currentTabIndex,
        children: _kTabPages,
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
