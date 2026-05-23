import UIKit
import Flutter
import GoogleMaps
import LocalAuthentication

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // Google Maps API Key
    GMSServices.provideAPIKey("AIzaSyCjQiGeX5XmOVIAQfEU_R0SYiW2bDypx98")

    // Developer mode / jailbreak detection channel
    if let controller = window?.rootViewController as? FlutterViewController {

      let securityChannel = FlutterMethodChannel(
        name: "com.tumiax/security",
        binaryMessenger: controller.binaryMessenger
      )

      securityChannel.setMethodCallHandler { (call, result) in

        if call.method == "isJailbrokenOrDeveloperMode" {
          result(self.isJailbroken())
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    }

    GeneratedPluginRegistrant.register(with: self)

    return super.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
  }

  // Jailbreak detection
  private func isJailbroken() -> Bool {

    #if targetEnvironment(simulator)
    return false
    #else

    let jailbreakPaths = [
      "/Applications/Cydia.app",
      "/Library/MobileSubstrate/MobileSubstrate.dylib",
      "/bin/bash",
      "/usr/sbin/sshd",
      "/etc/apt",
      "/private/var/lib/apt/",
      "/private/var/stash"
    ]

    for path in jailbreakPaths {
      if FileManager.default.fileExists(atPath: path) {
        return true
      }
    }

    let testFile = "/private/jailbreak.txt"

    do {
      try "test".write(
        toFile: testFile,
        atomically: true,
        encoding: .utf8
      )

      try FileManager.default.removeItem(atPath: testFile)

      return true

    } catch {
      // Device likely not jailbroken
    }

    return false

    #endif
  }
}