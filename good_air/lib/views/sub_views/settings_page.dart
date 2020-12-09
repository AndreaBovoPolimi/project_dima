import "package:flutter/material.dart";
import 'package:good_air/helpers/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;
  bool isDark;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Air', style: TextStyle(color: Colors.blueGrey)),
            Text(
              'Settings',
              style: TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SettingsList(
        // backgroundColor: Colors.orange,
        sections: [
          SettingsSection(
            title: 'Application',
            // titleTextStyle: TextStyle(fontSize: 30),
            tiles: [
              SettingsTile.switchTile(
                title: 'Dark theme',
                leading: Icon(Icons.brightness_2),
                switchValue: _themeNotifier.getIsDark(),
                onToggle: (bool value) {
                  setState(() {
                    isDark = value;
                    if (isDark) {
                      _themeNotifier.setDarkMode();
                    } else {
                      _themeNotifier.setLightMode();
                    }
                  });
                },
              ),
              SettingsTile(
                title: 'Environment',
                subtitle: 'Production',
                leading: Icon(Icons.cloud_queue),
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                title: 'Instagram',
                leading: Image(
                  image: ExactAssetImage(
                    'resources/instagram.png',
                  ),
                  width: 22,
                  height: 22,
                ),
              ),
              SettingsTile(
                title: 'Facebook',
                leading: Image(
                  image: ExactAssetImage(
                    'resources/facebook.png',
                  ),
                  width: 22,
                  height: 22,
                ),
              ),
              SettingsTile(
                title: 'Twitter',
                leading: Image(
                  image: ExactAssetImage(
                    'resources/twitter.png',
                  ),
                  width: 22,
                  height: 22,
                ),
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                enabled: true,
                leading: Icon(Icons.notifications_active),
                switchValue: true,
                onToggle: (value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                Text(''),
                Text(
                  'Version: 1.0.0',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
                Text(''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
