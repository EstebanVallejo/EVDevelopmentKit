import Foundation

public extension URL {
  
  static var cachesDirectory: URL {
    return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
  }
  
  static var documentsDirectory: URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
  }
  
}
