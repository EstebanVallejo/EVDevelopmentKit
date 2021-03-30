import Foundation

public extension Dictionary {
    
    public func removeNulls() -> Dictionary {
        var dict = self
        
        for key in dict.keys {
            if dict[key] is NSNull {
                dict.removeValue(forKey: key)
            }
        }
        
        return dict
    }
    
    public mutating func set(_ value: Value?, forKey key: Key?) {
        guard let value = value else {
            print("Can not append, Value is nil")
            return
        }
        
        guard let key = key else {
            print("Can not append, Key is nil")
            return
        }
        
        self[key] = value
    }
    
}

public extension Dictionary {
    
    public static func from(plist: String) -> Dictionary? {
        guard let fileUrl = Bundle.main.url(forResource: plist, withExtension: "plist"),
              let data = try? Data(contentsOf: fileUrl),
              let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary else {
            return nil
        }
        
        return dict
    }
}
