//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import flutter_local_notifications
import flutter_secure_storage_darwin
import local_auth_darwin
import package_info_plus
import shared_preferences_foundation
import url_launcher_macos
import workmanager_apple

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FlutterLocalNotificationsPlugin.register(with: registry.registrar(forPlugin: "FlutterLocalNotificationsPlugin"))
  FlutterSecureStorageDarwinPlugin.register(with: registry.registrar(forPlugin: "FlutterSecureStorageDarwinPlugin"))
  LocalAuthPlugin.register(with: registry.registrar(forPlugin: "LocalAuthPlugin"))
  FPPPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FPPPackageInfoPlusPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
  WorkmanagerPlugin.register(with: registry.registrar(forPlugin: "WorkmanagerPlugin"))
}
