import UIKit

public extension UIColor {
  public convenience init(r: Int, g: Int, b: Int, a: Float = 1) {
    let red = CGFloat(min(abs(r), 255)) / 255
    let green = CGFloat(min(abs(g), 255)) / 255
    let blue = CGFloat(min(abs(b), 255)) / 255
    let alpha = CGFloat(min(abs(a), 1))
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  public convenience init?(hexString: String) {
    let r, g, b, a: CGFloat
    let start: String.Index!
    
    if hexString.hasPrefix("#") {
      start = hexString.index(hexString.startIndex, offsetBy: 1)
    } else {
      start = hexString.startIndex
    }
    
    let hexColor = hexString.substring(from: start)
    
    let hexCharCount = hexColor.count
    if  hexCharCount != 6 && hexCharCount != 8 {
      print("Invalid HexString format")
      return nil
    }
    
    let scanner = Scanner(string: hexColor)
    var hexNumber: UInt64 = 0
    
    if scanner.scanHexInt64(&hexNumber) {
      
      if hexCharCount == 8 {
        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        a = CGFloat(hexNumber & 0x000000ff) / 255
      } else {
        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        b = CGFloat(hexNumber & 0x0000ff) / 255
        a = 1
      }
      
      self.init(red: r, green: g, blue: b, alpha: a)
      return
    }
    
    print("Can't scann Hex color")
    return nil
  }
}
