import Foundation

public enum AppInfo {
  
  public static var version: String? {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
  }
  
  public static var build: String? {
    return Bundle.main.infoDictionary?["CFBundleVersionString"] as? String
  }
  
  public static var bundleName: String? {
    return Bundle.main.infoDictionary?["CFBundleName"] as? String
  }
  
}
