import 'package:http/http.dart' as http;
import 'package:good_air/models/get_location.dart';

Future<GetLocation> getLocations(double lat, double lon) async {
  var contents = await http
      .get('https://api.openaq.org/v1/locations?coordinates=$lat, $lon');
  return GetLocation.fromJsonString(contents.body);
}
