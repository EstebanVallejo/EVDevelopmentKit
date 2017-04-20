import UIKit

public extension UIApplication {
  
  class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
      return topViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
      if let selected = tab.selectedViewController {
        return topViewController(base: selected)
      }
    }
    if let presented = base?.presentedViewController {
      return topViewController(base: presented)
    }
    return base
  }
  
}

public extension UIApplication {
  
  enum AppLinkOpenService {
    case Browser, iTunes, AppStore
    
    var prefix: String {
      switch self {
      case .Browser: return "http://"
      case .iTunes: return "itms://"
      case .AppStore: return "itms-apps://"
      }
    }
  }
  
  func openAppLink(appName: String, appId: String, service: AppLinkOpenService = .AppStore) -> Bool {
    
    let stringUrl = service.prefix + "itunes.apple.com/app/" + appName + "/id" + appId + "?mt=8"
    if let url = URL(string: stringUrl), canOpenURL(url) == true {
      return openURL(url)
    }
    
    return false
    
  }

}
