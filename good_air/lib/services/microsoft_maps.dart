import 'package:good_air/models/microsoft_fuzzy.dart';
import 'package:http/http.dart' as http;

String key = 'xJIY0pHnLKh-CO8ay1Hb_j_gA48CwhSwlQIo6h29zWs';
int limit = 5;
String apiVersion = '1.0';

Future<MicrosoftFuzzy> getFuzzySearch(String address) async {
  var contents = await http.get(
      'https://atlas.microsoft.com/search/fuzzy/json?subscription-key=$key&api-version=$apiVersion&limit=$limit&query=$address');
  return MicrosoftFuzzy.fromJsonString(contents.body);
}
