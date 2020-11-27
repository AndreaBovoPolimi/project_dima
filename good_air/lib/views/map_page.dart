import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/services/open_aq.dart';
import 'package:good_air/views/components/air_information.dart';
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

  void getUserLocation() async {
    var response = await Geolocator.getCurrentPosition();
    this.center = LatLng(response.latitude, response.longitude);
    changeAddressState();
  }

  void findAddressByString(String address) async {
    var response = await Geocoder.local.findAddressesFromQuery(address);
    this.center = LatLng(response.first.coordinates.latitude,
        response.first.coordinates.longitude);
    changeAddressState();
  }

  void findAddressByCoordinates(Coordinates coordinates) async {
    var response =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    this.center = LatLng(response.first.coordinates.latitude,
        response.first.coordinates.longitude);
    changeAddressState();
  }

  void changeAddressState() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: center, zoom: 15.0)));
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
    showDialog(
        context: context, builder: (_) => new AirInformation(getLocation));
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
          zoom: 15.0,
        ),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
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
        top: size.height * 0.006,
        left: size.width * 0.01,
        child: Container(
            width: size.width * 0.98,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              controller: searchBarController,
              onSubmitted: (value) => {findAddressByString(value)},
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Enter address',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () =>
                        {findAddressByString(searchBarController.value.text)},
                  )),
            )),
      )
    ]));
  }
}
