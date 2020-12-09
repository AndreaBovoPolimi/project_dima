import 'package:flutter/material.dart';
import 'package:good_air/helpers/storage_manager.dart';

final darkTheme = ThemeData.dark();

/*
ThemeData.raw(
    visualDensity: null,
    primaryColor: null,
    primaryColorBrightness: null,
    primaryColorLight: null,
    primaryColorDark: null,
    canvasColor: null,
    shadowColor: null,
    accentColor: null,
    accentColorBrightness: null,
    scaffoldBackgroundColor: null,
    bottomAppBarColor: null,
    cardColor: null,
    dividerColor: null,
    focusColor: null,
    hoverColor: null,
    highlightColor: null,
    splashColor: null,
    splashFactory: null,
    selectedRowColor: null,
    unselectedWidgetColor: null,
    disabledColor: null,
    buttonTheme: null,
    buttonColor: null,
    toggleButtonsTheme: null,
    secondaryHeaderColor: null,
    textSelectionColor: null,
    cursorColor: null,
    textSelectionHandleColor: null,
    backgroundColor: null,
    dialogBackgroundColor: null,
    indicatorColor: null,
    hintColor: null,
    errorColor: null,
    toggleableActiveColor: null,
    textTheme: null,
    primaryTextTheme: null,
    accentTextTheme: null,
    inputDecorationTheme: null,
    iconTheme: null,
    primaryIconTheme: null,
    accentIconTheme: null,
    sliderTheme: null,
    tabBarTheme: null,
    tooltipTheme: null,
    cardTheme: null,
    chipTheme: null,
    platform: null,
    materialTapTargetSize: null,
    applyElevationOverlayColor: null,
    pageTransitionsTheme: null,
    appBarTheme: null,
    bottomAppBarTheme: null,
    colorScheme: null,
    dialogTheme: null,
    floatingActionButtonTheme: null,
    navigationRailTheme: null,
    typography: null,
    cupertinoOverrideTheme: null,
    snackBarTheme: null,
    bottomSheetTheme: null,
    popupMenuTheme: null,
    bannerTheme: null,
    dividerTheme: null,
    buttonBarTheme: null,
    bottomNavigationBarTheme: null,
    timePickerTheme: null,
    textButtonTheme: null,
    elevatedButtonTheme: null,
    outlinedButtonTheme: null,
    textSelectionTheme: null,
    dataTableTheme: null,
    fixTextFieldOutlineLabel: null,
    useTextSelectionTheme: null);
*/

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
