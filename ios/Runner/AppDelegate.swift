import UIKit
import Flutter
import GoogleMaps
import flutter_auth0

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(Constants.GoogleMapApiKey)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ app: UIApplication,
                               open url: URL,
                               options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return FlutterAuth0Plugin.application(app, open: url, options: options)
    }
}
