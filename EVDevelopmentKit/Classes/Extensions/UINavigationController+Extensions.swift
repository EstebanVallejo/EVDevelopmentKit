import UIKit

public extension UINavigationController {
  
  public func removeNavbarBottomLine() {
    navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    navigationBar.shadowImage = UIImage()
  }
  
}
