import UIKit

extension UIView {
  public var x: CGFloat {
    get { return origin.x }
    set { origin = CGPoint(x: newValue, y: y) }
  }
  
  public var y: CGFloat {
    get { return origin.y }
    set { origin = CGPoint(x: x, y: newValue) }
  }
  
  public var width: CGFloat {
    get { return size.width }
    set { size = CGSize(width: newValue, height: height) }
  }
  
  public var height: CGFloat {
    get { return size.height }
    set { size = CGSize(width: width, height: newValue) }
  }
  
  public var size: CGSize {
    get { return bounds.size }
    set { frame = CGRect(origin: origin, size: newValue) }
  }
  
  public var origin: CGPoint {
    get { return frame.origin }
    set { frame = CGRect(origin: newValue, size: size) }
  }
  
}

extension UIView {
  
  @IBInspectable public var cornerRadius: CGFloat {
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
    
    get { return layer.cornerRadius }
  }
  
  @IBInspectable public var borderWidth: CGFloat {
    set { layer.borderWidth = newValue }
    get { return layer.borderWidth }
  }
  
  @IBInspectable public var borderColor: UIColor? {
    set { layer.borderColor = newValue?.cgColor }
    
    get {
      if layer.borderColor != nil {
        return UIColor(cgColor: layer.borderColor!)
      } else {
        return nil
      }
    }
  }
  
}

extension UIView {
  
  public var hypotenuse: CGFloat {
    return sqrt(pow(width, 2) + pow(height, 2))
  }
  
}

extension UIView {
  
  public func rounded(updateLayout layoutIfNeeded: Bool = true) {
    if layoutIfNeeded { self.layoutIfNeeded() }
    roundCorners(radius: min(width, height)/2)
  }
  
  public func roundCorners(radius: CGFloat) {
    layer.cornerRadius = radius
    layer.masksToBounds = radius > 0
  }

}

extension UIView {
  
  public func takeSnapshot() -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
    
    drawHierarchy(in: bounds, afterScreenUpdates: true)
    //    layer.renderInContext(UIGraphicsGetCurrentContext())
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

}
