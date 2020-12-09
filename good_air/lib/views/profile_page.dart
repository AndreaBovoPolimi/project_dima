import 'package:flutter/material.dart';
import 'package:good_air/sqlite/db_helper.dart';
import 'package:good_air/sqlite/entities/info_feed_story.dart';
import 'package:good_air/views/sub_views/graph_page.dart';
import 'package:good_air/views/sub_views/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  State<ProfilePage> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  int count = 0;
  TabController tabController;
  DbHelper helper = DbHelper();
  List<InfoFeedStoryEntity> infoFeed;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (infoFeed == null) {
      infoFeed = List<InfoFeedStoryEntity>();
      getData();
    }

    var now = DateTime.now();
    final _kTabPages = TabBarView(controller: tabController, children: <Widget>[
      GraphPage(infoFeed
          .where((element) =>
              now
                  .difference(DateTime.fromMillisecondsSinceEpoch(element.date))
                  .inHours <=
              24)
          .toList()),
      GraphPage(infoFeed
          .where((element) =>
              now
                  .difference(DateTime.fromMillisecondsSinceEpoch(element.date))
                  .inDays <=
              7)
          .toList()),
      GraphPage(infoFeed
          .where((element) =>
              now
                  .difference(DateTime.fromMillisecondsSinceEpoch(element.date))
                  .inDays <=
              30)
          .toList()),
      GraphPage(infoFeed),
    ]);
    final _kTabs =
        TabBar(controller: tabController, labelColor: Colors.blueAccent, tabs: [
      Tab(text: '24 hours'),
      Tab(text: '7 days'),
      Tab(text: '30 days'),
      Tab(text: 'All'),
    ]);
    return Flexible(
        child: Stack(children: [
      Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.white10,
              elevation: 0.0,
              flexibleSpace: SafeArea(
                child: _kTabs,
              )),
          body: _kTabPages),
      Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            child: Icon(
              Icons.settings,
            ),
            heroTag: "settings",
          ))
    ]));
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getInfoFeedStory();
      todosFuture.then((result) {
        List<InfoFeedStoryEntity> list = List<InfoFeedStoryEntity>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          list.add(InfoFeedStoryEntity.fromObject(result[i]));
        }
        setState(() {
          infoFeed = list;
          count = count;
        });
      });
    });
  }
}
