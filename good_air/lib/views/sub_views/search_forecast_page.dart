import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:good_air/models/microsoft_fuzzy.dart';
import 'package:good_air/services/microsoft_maps.dart';
import 'package:good_air/sqlite/db_helper.dart';
import 'package:good_air/sqlite/entities/forecast.dart';
import 'package:good_air/sqlite/entities/search_story.dart';

class SearchForecastPage extends StatefulWidget {
  List<ForecastEntity> forecastList;
  SearchForecastPage(List<ForecastEntity> forecastList) {
    this.forecastList = forecastList;
  }

  State<SearchForecastPage> createState() {
    return SearchForecastPageState(forecastList);
  }
}

class SearchForecastPageState extends State<SearchForecastPage> {
  TextEditingController titleText;
  DbHelper helper = DbHelper();
  List<SearchStoryEntity> searchStories;
  List<ForecastEntity> forecastList;
  MicrosoftFuzzy listFuzzy;
  int count = 0;
  bool _visible = true;

  SearchForecastPageState(List<ForecastEntity> forecastList) {
    this.forecastList = forecastList;
  }

  Widget build(BuildContext context) {
    if (searchStories == null) {
      searchStories = List<SearchStoryEntity>();
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
              hintText: 'Add location...'),
          controller: titleText,
          style: TextStyle(color: Colors.blueGrey),
          onChanged: (value) async => {await _onChangedTextField(value)},
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: searchListItems(),
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
                    submitForecast(this.searchStories[position].address);
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
                  leading: Icon(Icons.add_location_outlined),
                  title:
                      Text(listFuzzy.results[position].address.freeformAddress),
                  onTap: () {
                    submitForecast(
                        listFuzzy.results[position].address.freeformAddress);
                  },
                ),
              );
            },
          ));
    }
  }

  Future submitForecast(String address) async {
    await addAddress(address);
    submitPage();
  }

  void submitPage() {
    Navigator.pop(context);
  }

  Future addAddress(String address) async {
    var itemToDelete = forecastList.firstWhere(
        (element) => element.address == address,
        orElse: () => null);
    if (itemToDelete != null) {
      return;
    }
    var response = await Geocoder.local.findAddressesFromQuery(address);
    await helper.insertForecast(ForecastEntity(
        address,
        response.first.coordinates.latitude,
        response.first.coordinates.longitude));
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
