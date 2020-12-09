import 'package:flutter/material.dart';
import 'package:good_air/helpers/theme_notifier.dart';
import 'package:good_air/views/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => new ThemeNotifier(), child: Material()));
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
              theme: theme.getTheme(),
              title: 'GoodAir',
              debugShowCheckedModeBanner: false,
              home: MainPage(),
            ));
  }
}
