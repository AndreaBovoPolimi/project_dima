import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/services/open_aq.dart';
import 'package:good_air/views/components/air_information.dart';
import 'package:good_air/views/main_page.dart';
import 'package:good_air/views/sub_views/search_map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  State<MapPage> createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  LatLng center = MainPageState.userLocation;
  GoogleMapController mapController;
  Set<Marker> markers = Set();
  var map;
  var searchBarController = TextEditingController();
  MapPageState() {
    getUserLocation();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getUserLocation();
  }

  void getUserLocation() async {
    var response = await Geolocator.getCurrentPosition();
    this.center = LatLng(response.latitude, response.longitude);
    changeAddressState();
  }

  void findAddressByString(String address) async {
    var response = await Geocoder.local.findAddressesFromQuery(address);
    if (response.isNotEmpty) {
      this.center = LatLng(response.first.coordinates.latitude,
          response.first.coordinates.longitude);
      changeAddressState();
    }
  }

  void findAddressByCoordinates(Coordinates coordinates) async {
    var response =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if (response.isNotEmpty) {
      this.center = LatLng(response.first.coordinates.latitude,
          response.first.coordinates.longitude);
      changeAddressState();
    }
  }

  void changeAddressState() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: center, zoom: 12.0)));
    markers.clear();
    var marker = Marker(
        markerId: MarkerId('SomeId'),
        position: center,
        onTap: () {
          showInformation();
        });
    markers.add(marker);
    searchBarController.clear();
    setState(() {});
  }

  void showInformation() async {
    var getLocation = await getLocations(center.latitude, center.longitude);
    showDialog(context: context, builder: (_) => AirInformation(getLocation));
  }

  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;

    return Flexible(
        child: Stack(children: [
      GoogleMap(
        onMapCreated: onMapCreated,
        mapToolbarEnabled: false,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 11.0,
        ),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onTap: (value) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        onLongPress: (value) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          findAddressByCoordinates(
              new Coordinates(value.latitude, value.longitude));
        },
      ),
      Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: () {
              getUserLocation();
            },
            child: Icon(Icons.my_location),
            backgroundColor: Colors.blue,
            heroTag: "position",
          )),
      Positioned(
          bottom: 80,
          right: 10,
          child: FloatingActionButton(
            onPressed: () async {
              _awaitFinishNextScreen();
            },
            child: Icon(Icons.search_outlined),
            backgroundColor: Colors.blue,
            heroTag: "search",
          ))
    ]));
  }

  void _awaitFinishNextScreen() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchMapPage()),
    );
    if (result != null) {
      findAddressByString(result);
    }
  }
}
