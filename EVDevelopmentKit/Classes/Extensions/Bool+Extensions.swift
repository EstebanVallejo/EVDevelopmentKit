import Foundation

public extension Bool {
  
  public static func randomValue() -> Bool {
    return arc4random_uniform(2) == 0 ? false : true
  }
  
  public func asString() -> String {
    return self == true ? "true" : "false"
  }
  
}
