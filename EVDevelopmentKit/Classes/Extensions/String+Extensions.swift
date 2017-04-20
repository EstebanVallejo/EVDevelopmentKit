import Foundation

public extension String {
  public func localized(comment: String = "") -> String {
    return NSLocalizedString(self, comment: comment)
  }
  
  public var words: [String] {
    return components(separatedBy: " ")
  }
  
  public var base64: String? {
    guard let data = self.data(using: String.Encoding.utf8) else {
      return nil
    }
    
    return data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
  }
  
  public func asBool() -> Bool? {
    let lcsd = self.lowercased()
  
    if lcsd == "false" {
      return false
    } else if lcsd == "true" {
      return true
    } else {
      return nil
    }

  }
  
  public func trimWhitespacesAndNewlines() -> String {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  
  public func nonEmpty() -> String? {
    
    let trimmedString = self.trimWhitespacesAndNewlines()
    
    return trimmedString.isEmpty ? nil : self
    
  }
  
}
