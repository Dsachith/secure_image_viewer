#include "include/secure_image_viewer/secure_image_viewer_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "secure_image_viewer_plugin.h"

void SecureImageViewerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  secure_image_viewer::SecureImageViewerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
