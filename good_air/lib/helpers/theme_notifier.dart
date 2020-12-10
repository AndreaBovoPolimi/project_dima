import 'package:flutter/material.dart';
import 'package:good_air/helpers/storage_manager.dart';

final darkTheme = ThemeData.dark();
/*ThemeData(
  accentColor: Colors.cyan,
  iconTheme: IconThemeData(color: Colors.white),
  appBarTheme: AppBarTheme(
      color: Colors.black,
      actionsIconTheme: IconThemeData(color: Colors.cyan),
      shadowColor: Colors.black),
  bottomAppBarColor: Colors.black,
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFFFFFFFF),
  accentIconTheme: IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.black,
  dividerColor: Colors.black,
  textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white)),
);*/

final lightTheme = ThemeData.light();

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;
  bool isDark;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        isDark = false;
        _themeData = lightTheme;
      } else {
        isDark = true;
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  getTheme() => _themeData;
  getIsDark() => isDark;

  void setDarkMode() async {
    _themeData = darkTheme;
    isDark = true;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    isDark = false;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
