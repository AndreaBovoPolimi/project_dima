import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/views/main_page.dart';
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

  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    this.center = LatLng(position.latitude, position.longitude);
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: center, zoom: 11.0)));
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: center,
        infoWindow: InfoWindow(title: "Informazioni sull'aria")));
    setState(() {});
  }

  void findAddress(String address) async {
    var response = await Geocoder.local.findAddressesFromQuery(address);
    this.center = LatLng(response.first.coordinates.latitude,
        response.first.coordinates.longitude);
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: center, zoom: 11.0)));
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: center,
        infoWindow: InfoWindow(title: "Informazioni sull'aria")));
    searchBarController.clear();
    setState(() {});
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
      ),
      Positioned(
        top: size.height * 0.006,
        left: size.width * 0.01,
        child: Container(
            width: size.width * 0.98,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              controller: searchBarController,
              onSubmitted: (value) => {findAddress(value)},
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Enter address',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => {},
                  )),
            )),
      ),
      Positioned(
          top: size.height * 0.75,
          left: size.width * 0.83,
          child: FloatingActionButton(
            onPressed: () {
              getUserLocation();
            },
            child: Icon(Icons.my_location),
            backgroundColor: Colors.blue,
            heroTag: false,
          ))
    ]));
  }
}
