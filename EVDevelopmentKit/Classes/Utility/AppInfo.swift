import Foundation

enum AppInfo {
  
  static var version: String? {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
  }
  
  static var build: String? {
    return Bundle.main.infoDictionary?["CFBundleVersionString"] as? String
  }
  
  static var bundleName: String? {
    return Bundle.main.infoDictionary?["CFBundleName"] as? String
  }
  
}
