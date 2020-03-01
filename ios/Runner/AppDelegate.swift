import UIKit
import Flutter
import GoogleMaps
import FlutterAuth0Plugin

// - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
//   return [FlutterAuth0Plugin application:app openURL:url options:options];
// }

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(Constants.GoogleMapApiKey)
    return FlutterAuth0Plugin.application(app, open: url, options: launchOptions)
    // return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
