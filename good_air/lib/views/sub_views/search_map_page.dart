import 'package:flutter/material.dart';
import 'package:good_air/models/microsoft_fuzzy.dart';
import 'package:good_air/services/microsoft_maps.dart';
import 'package:good_air/sqlite/db_helper.dart';
import 'package:good_air/sqlite/entities/search_story.dart';

class SearchMapPage extends StatefulWidget {
  State<SearchMapPage> createState() {
    return SearchMapPageState();
  }
}

class SearchMapPageState extends State<SearchMapPage> {
  TextEditingController titleText;
  DbHelper helper = DbHelper();
  List<SearchStoryEntity> searchStories;
  MicrosoftFuzzy listFuzzy;
  int count = 0;
  bool _visible = true;

  Widget build(BuildContext context) {
    if (searchStories == null) {
      searchStories = List<SearchStoryEntity>();
      getData();
    }

    var listView = searchListItems();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
          onPressed: () => Navigator.pop(context),
        ),
        brightness: Brightness.light,
        title: TextField(
          autofocus: true,
          decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: -15, bottom: 11, top: 11, right: 15),
              hintText: 'Search...'),
          controller: titleText,
          style: TextStyle(color: Colors.blueGrey),
          onChanged: (value) async => {await _onChangedTextField(value)},
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: listView,
    );
  }

  Future _onChangedTextField(String value) async {
    if (value.isNotEmpty) {
      listFuzzy = await getFuzzySearch(value);
      setState(() => {_visible = false});
    }
    if (value.isEmpty) {
      setState(() => {_visible = true});
    }
  }

  Visibility searchListItems() {
    if (_visible) {
      return Visibility(
          visible: _visible,
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: count,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.location_history_outlined),
                  title: Text(this.searchStories[position].address),
                  onTap: () {
                    submitAndSaveAddress(this.searchStories[position].address);
                  },
                ),
              );
            },
          ));
    } else {
      return Visibility(
          visible: !_visible,
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: listFuzzy.results.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title:
                      Text(listFuzzy.results[position].address.freeformAddress),
                  onTap: () {
                    submitAndSaveAddress(
                        listFuzzy.results[position].address.freeformAddress);
                  },
                ),
              );
            },
          ));
    }
  }

  void submitAndSaveAddress(String address) {
    addAddress(address);
    submitAddress(address);
  }

  void submitAddress(String address) {
    Navigator.pop(context, address);
  }

  void addAddress(String address) {
    var itemToDelete = searchStories.firstWhere(
        (element) => element.address == address,
        orElse: () => null);
    if (itemToDelete != null) {
      helper.deleteSearchStory(itemToDelete.id);
    }
    if (searchStories.length > 5) {
      helper.deleteSearchStory(searchStories.last.id);
    }
    helper.insertSearchStory(
        SearchStoryEntity(address, DateTime.now().millisecondsSinceEpoch));
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getSearchStory();
      todosFuture.then((result) {
        List<SearchStoryEntity> searchStoryList = List<SearchStoryEntity>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          searchStoryList.add(SearchStoryEntity.fromObject(result[i]));
        }
        setState(() {
          searchStories = searchStoryList;
          count = count;
        });
      });
    });
  }
}
