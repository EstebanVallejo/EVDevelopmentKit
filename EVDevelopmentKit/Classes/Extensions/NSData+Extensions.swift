import Foundation

public extension NSData {
  func stringFromDeviceToken() -> String! {
    
    var bytes = [UInt8](repeating: 0, count: self.length)
    self.getBytes(&bytes, length: bytes.count)
    var token = String()
    
    for i in 0 ..< bytes.count {
      token += String(format: "%02.2hhX", bytes[i])
    }
    
    return token
  }
}
