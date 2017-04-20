import Foundation

public extension Bool {
  
  static func randomValue() -> Bool {
    return arc4random_uniform(2) == 0 ? false : true
  }
  
  func asString() -> String {
    return self == true ? "true" : "false"
  }
  
}
