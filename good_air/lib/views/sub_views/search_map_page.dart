import 'package:flutter/material.dart';
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
  List<SearchStory> searchStories;
  int count = 0;

  Widget build(BuildContext context) {
    if (searchStories == null) {
      searchStories = List<SearchStory>();
      getData();
    }

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
          onSubmitted: (value) => {submitAndSaveAddress(value)},
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: searchListItems(),
    );
  }

  ListView searchListItems() {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(Icons.adjust_outlined),
            title: Text(this.searchStories[position].address),
            onTap: () {
              submitAndSaveAddress(this.searchStories[position].address);
            },
          ),
        );
      },
    );
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
      helper.deleteRecord(itemToDelete.id);
    }
    if (searchStories.length > 5) {
      helper.deleteRecord(searchStories.last.id);
    }
    helper.insertRecord(SearchStory(address, DateTime.now().toString()));
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getRecords();
      todosFuture.then((result) {
        List<SearchStory> searchStoryList = List<SearchStory>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          searchStoryList.add(SearchStory.fromObject(result[i]));
        }
        setState(() {
          searchStories = searchStoryList;
          count = count;
        });
      });
    });
  }
}
