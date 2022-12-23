import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


// import UIKit
// import Flutter
// import Firebase 

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     FirebaseApp.configure()
//      Messaging.messaging().delegate = self
//     GeneratedPluginRegistrant.register(with: self)
//     if #available(iOS 10.0, *) {
//       UNUserNotificationCenter.current().delegate = self
//         let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//         UNUserNotificationCenter.current().requestAuthorization(
//                 options: authOptions,
//                 completionHandler: {_, _ in })
     
//       // UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
//     }
//     else {
//         let settings: UIUserNotificationSettings =
//         UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//         application.registerUserNotificationSettings(settings)
//     }
//     application.registerForRemoteNotifications()
//     // GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
