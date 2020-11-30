import 'package:good_air/models/info_feed.dart';
import 'package:good_air/models/info_map.dart';
import 'package:http/http.dart' as http;

String token = '7b61b86f9c55b9cb0b73a5780bb5ab04b7656f65';

Future<InfoMap> getInfoMap(double lat, double lon) async {
  var contents = await http.get(
      'https://api.waqi.info/map/bounds/?latlng=${lat - 1},${lon - 1},${lat + 1},${lon + 1}&token=$token');
  return InfoMap.fromJsonString(contents.body);
}

Future<InfoFeed> getInfoFeed(double lat, double lon) async {
  var contents =
      await http.get('https://api.waqi.info/feed/geo:$lat;$lon/?token=$token');
  return InfoFeed.fromJsonString(contents.body);
}
