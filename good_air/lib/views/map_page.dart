import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_air/models/info_map.dart';
import 'package:good_air/services/aqicn.dart';
import 'package:good_air/views/components/air_information.dart';
import 'package:good_air/views/main_page.dart';
import 'package:good_air/views/sub_views/search_map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);
  State<MapPage> createState() {
    return MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  LatLng center = MainPageState.userLocation;
  InfoMap infoMap;
  GoogleMapController mapController;
  Set<Marker> markers = Set();
  MapPageState() {
    getUserLocation();
  }

  Future getInfoMapAPI() async {
    infoMap = await getInfoMap(await mapController.getVisibleRegion());
    for (int i = 0; i < infoMap.data.length; i++) {
      if (int.tryParse(infoMap.data[i].aqi) != null) {
        var marker = Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                getColorMarker(int.parse(infoMap.data[i].aqi))),
            markerId: MarkerId(infoMap.data[i].uid.toString()),
            position: LatLng(infoMap.data[i].lat, infoMap.data[i].lon),
            onTap: () {
              showInformation(LatLng(infoMap.data[i].lat, infoMap.data[i].lon));
            });
        markers.add(marker);
      }
    }
    setState(() {});
  }

  double getColorMarker(int valAqi) {
    if (valAqi >= 0 && valAqi <= 50) {
      return BitmapDescriptor.hueGreen;
    } else if (valAqi > 50 && valAqi <= 100) {
      return BitmapDescriptor.hueYellow;
    } else if (valAqi > 100 && valAqi <= 150) {
      return BitmapDescriptor.hueOrange;
    } else if (valAqi > 150 && valAqi <= 200) {
      return BitmapDescriptor.hueRed;
    } else if (valAqi > 200 && valAqi <= 300) {
      return BitmapDescriptor.hueMagenta;
    } else if (valAqi > 300) {
      return BitmapDescriptor.hueViolet;
    }
    return BitmapDescriptor.hueGreen;
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

  Future changeAddressState() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: center, zoom: 8.0)));
    markers.clear();
    var marker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        markerId: MarkerId(0.toString()),
        position: center,
        onTap: () {
          showInformation(center);
        });
    markers.add(marker);
    setState(() {});
    await getInfoMapAPI();
  }

  void showInformation(LatLng position) async {
    var getInfoFeedJson =
        await getInfoFeed(position.latitude, position.longitude);
    showDialog(
        context: context, builder: (_) => AirInformation(getInfoFeedJson));
  }

  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;

    return Flexible(
        child: Stack(children: [
      GoogleMap(
        onMapCreated: onMapCreated,
        minMaxZoomPreference: MinMaxZoomPreference(7, 18),
        mapToolbarEnabled: false,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 8.0,
        ),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onLongPress: (value) {
          //FocusScopeNode currentFocus = FocusScope.of(context);
          //if (!currentFocus.hasPrimaryFocus) {
          //  currentFocus.unfocus();
          //}
          findAddressByCoordinates(
              new Coordinates(value.latitude, value.longitude));
        },
        onCameraIdle: () async {
          await getInfoMapAPI();
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
