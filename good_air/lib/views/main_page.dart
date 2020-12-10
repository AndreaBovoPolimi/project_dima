import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/helpers/google_ads.dart';
import 'package:good_air/helpers/update_info_position.dart';
import 'package:good_air/views/forecast_page.dart';
import 'package:good_air/views/profile_page.dart';
import 'package:good_air/views/ranking_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'news_page.dart';
import 'map_page.dart';
import 'package:workmanager/workmanager.dart';
import 'dart:io' show Platform, sleep;

const fetchBackground = "fetchBackground";

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    //WidgetsFlutterBinding.ensureInitialized();
    await updateInfoPosition();
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
  bool myLocaleIsNull = true;
  Address addressPosition;
  InterstitialAd _interstitialAd;

  void _loadInterstitialAd() {
    _interstitialAd
      ..load()
      ..show();
  }

  static var userLocation;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _interstitialAd = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
    );

    _loadInterstitialAd();

    if (Platform.isIOS) {
      updateInfoPosition();
    }
    if (Platform.isAndroid) {
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
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  Future<void> loadUserPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    userLocation = LatLng(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude));
    addressPosition = addresses.first;
    setState(() {
      myLocaleIsNull = false;
    });
  }

  MainPageState() {
    loadUserPosition();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NewsPage(key: PageStorageKey('News')),
      RankingPage(key: PageStorageKey('Ranking')),
      MapPage(key: PageStorageKey('Map')),
      ForecastPage(key: PageStorageKey('Forecast')),
      ProfilePage(key: PageStorageKey('Profile')),
    ];

    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(_currentTabIndex == 0
              ? Icons.format_align_left
              : Icons.format_align_left_outlined),
          label: 'News'),
      BottomNavigationBarItem(
          icon:
              Icon(_currentTabIndex == 1 ? Icons.grade : Icons.grade_outlined),
          label: myLocaleIsNull ? 'Ranking' : addressPosition.countryName),
      BottomNavigationBarItem(
          icon: Icon(_currentTabIndex == 2 ? Icons.map : Icons.map_outlined),
          label: 'Maps'),
      BottomNavigationBarItem(
          icon: Icon(_currentTabIndex == 3
              ? Icons.wallpaper
              : Icons.wallpaper_outlined),
          label: 'Forecast'),
      BottomNavigationBarItem(
          icon: Icon(_currentTabIndex == 4
              ? Icons.account_circle
              : Icons.account_circle_outlined),
          label: 'Profile'),
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
        elevation: 0.0,
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
