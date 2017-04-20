import Foundation

public extension Array {
  var randomElement: Element? {
    get {
      guard isEmpty == false else { return nil }
      
      let randomIndex = arc4random_uniform(UInt32(count))
      return self[Int(randomIndex)]
    }
  }
  
  static func from(plist: String) -> Array? {
    guard let fileUrl = Bundle.main.url(forResource: plist, withExtension: "plist"),
      let data = try? Data(contentsOf: fileUrl),
      let _array = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Array,
      let array = _array else {
        return nil
    }
    
    return array
  }
}

public extension Array where Element : Equatable {
  mutating func removeObject(object : Element, onlyFirst: Bool = false) {
    if let index = index(of: object) {
      remove(at: index)
    } else {
      return
    }
    
    if onlyFirst == false {
      removeObject(object: object, onlyFirst: false)
    }
    
  }
}
