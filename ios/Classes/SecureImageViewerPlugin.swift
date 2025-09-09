import Flutter
import UIKit

public class SecureImageViewerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "secure_image_viewer", binaryMessenger: registrar.messenger())
    let instance = SecureImageViewerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "enableSecureMode" {
        // iOS doesn't allow blocking screenshots directly.
        // Instead, listen for screen capture state changes.
        if #available(iOS 11.0, *) {
            NotificationCenter.default.addObserver(
              forName: UIScreen.capturedDidChangeNotification,
              object: nil,
              queue: .main
            ) { _ in
                print("⚠️ Screen capture detected")
            }
        }
        result(true)
    } else if call.method == "disableSecureMode" {
        result(true)
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}
