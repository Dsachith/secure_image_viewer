#ifndef FLUTTER_PLUGIN_SECURE_IMAGE_VIEWER_PLUGIN_H_
#define FLUTTER_PLUGIN_SECURE_IMAGE_VIEWER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace secure_image_viewer {

class SecureImageViewerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SecureImageViewerPlugin();

  virtual ~SecureImageViewerPlugin();

  // Disallow copy and assign.
  SecureImageViewerPlugin(const SecureImageViewerPlugin&) = delete;
  SecureImageViewerPlugin& operator=(const SecureImageViewerPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace secure_image_viewer

#endif  // FLUTTER_PLUGIN_SECURE_IMAGE_VIEWER_PLUGIN_H_
