import 'package:geolocator/geolocator.dart';
import 'package:good_air/helpers/color_aqi.dart';
import 'package:good_air/services/aqicn.dart';
import 'package:good_air/sqlite/db_helper.dart';
import 'package:good_air/sqlite/entities/info_feed_story.dart';
import 'package:good_air/notifications/notification.dart' as notif;

Future updateInfoPosition() async {
  DbHelper helper = DbHelper();

  Position userLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  //var lastInfoFeed = await helper.getLastInfoFeedStory();
  var infoFeed =
      await getInfoFeed(userLocation.latitude, userLocation.longitude);
  await helper.insertInfoFeedStory(InfoFeedStoryEntity(
      userLocation.latitude,
      userLocation.longitude,
      (infoFeed.data.iaqi.co != null) ? infoFeed.data.iaqi.co.v : null,
      (infoFeed.data.iaqi.h != null) ? infoFeed.data.iaqi.h.v : null,
      (infoFeed.data.iaqi.no2 != null) ? infoFeed.data.iaqi.no2.v : null,
      (infoFeed.data.iaqi.p != null) ? infoFeed.data.iaqi.p.v : null,
      (infoFeed.data.iaqi.pm10 != null)
          ? double.parse(infoFeed.data.iaqi.pm10.v.toString())
          : null,
      (infoFeed.data.iaqi.pm25 != null)
          ? double.parse(infoFeed.data.iaqi.pm25.v.toString())
          : null,
      (infoFeed.data.iaqi.t != null) ? infoFeed.data.iaqi.t.v : null,
      (infoFeed.data.iaqi.dew != null) ? infoFeed.data.iaqi.dew.v : null,
      (infoFeed.data.iaqi.o3 != null) ? infoFeed.data.iaqi.o3.v : null,
      (infoFeed.data.iaqi.so2 != null) ? infoFeed.data.iaqi.so2.v : null,
      (infoFeed.data.iaqi.w != null) ? infoFeed.data.iaqi.w.v : null,
      infoFeed.data.aqi.toInt(),
      DateTime.now().millisecondsSinceEpoch));
  /*if (!(lastInfoFeed.isEmpty || lastInfoFeed == null)) {
    if (getColorAqiNumber(int.parse(lastInfoFeed.first.aqi)) !=
        getColorAqiNumber(infoFeed.data.aqi)) {
      if (lastInfoFeed.first.aqi < infoFeed.data.aqi) {
        notif.Notification notification = new notif.Notification();
        notification.showNotificationChangeAir(
            'You are in a worse position than before');
      } else {
        notif.Notification notification = new notif.Notification();
        notification.showNotificationChangeAir(
            'You are in a better position than before');
      }
    }
  }*/
}
