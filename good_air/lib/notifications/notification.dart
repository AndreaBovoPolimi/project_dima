import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future showNotificationChangeAir(String message) async {
    var rng = new Random();
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        '1', 'location-bg', 'fetch location in background',
        playSound: true, importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: true);
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      rng.nextInt(1000),
      'Air Quality',
      message,
      platformChannelSpecifics,
      payload: '',
    );
  }

  Notification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
