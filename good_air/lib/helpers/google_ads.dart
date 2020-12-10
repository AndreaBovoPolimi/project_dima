import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8648733948875608~5422203138';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8648733948875608~7062943081';
    }
    return null;
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8648733948875608/8263988896';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8648733948875608/4189367730';
    }
    return null;
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8648733948875608/6759335532';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8648733948875608/3264117116';
    }
    return null;
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8648733948875608/4411840969';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8648733948875608/1785677620';
    }
    return null;
  }
}
