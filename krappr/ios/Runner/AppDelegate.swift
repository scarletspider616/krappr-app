import UIKit
import Flutter
import GooglePlaces
import Keys

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSPlacesClient.provideAPIKey(Keys.GoogleMapApiKey)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
