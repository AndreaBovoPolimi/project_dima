import UIKit
import Flutter
import GoogleMaps
import Firebase
//import workmanager

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    var flutter_native_splash = 1
    //UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*60))
    //WorkmanagerPlugin.register(with: self.registrar(forPlugin: "be.tramckrijte.workmanager.WorkmanagerPlugin")!)
    FirebaseApp.configure()
    UIApplication.shared.isStatusBarHidden = false

    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyA2RPfX7vT1xqnpCgBNOuVOgdOOKpsW1m0")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}