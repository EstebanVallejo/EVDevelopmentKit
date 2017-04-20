import UIKit

public extension UIImage {
  
  public class func with(color: UIColor!) -> UIImage! {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size);
    let context = UIGraphicsGetCurrentContext();
    
    context!.setFillColor(color.cgColor);
    context!.fill(rect);
    
    let image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
  }
  
}

public extension UIImage {
  
  public enum Format {
    case png
    case jpeg(compressionQuality: CGFloat)
    
    var mimeType: String {
      return "image/\(ext)"
    }
    
    var ext: String {
      switch self {
      case .png: return "png"
      case .jpeg: return "jpeg"
      }
    }
  }
  
  public func formattedAs(_ format: Format) -> Data {
    switch format {
    case .png: return asPNG()
    case .jpeg(let compressionQuality): return asJPEG(with: compressionQuality)
    }
  }
  
  public func asPNG() -> Data {
    guard let pngRepresentation = UIImagePNGRepresentation(self) else {
      fatalError("Cant get PNG Representation")
    }
    return pngRepresentation
  }
  
  public func asJPEG(with compressionQuality: CGFloat = 1.0) -> Data {
    guard let jpegRepresentation = UIImageJPEGRepresentation(self, max(min(compressionQuality, 1.0), 0.0)) else {
      fatalError("Cant get JPEG Representation")
    }
    
    return jpegRepresentation
  }
  
}

public extension UIImage {
  
  // colorize image with given tint color
  // this is similar to Photoshop's "Color" layer blend mode
  // this is perfect for non-greyscale source images, and images that have both highlights and shadows that should be preserved
  // white will stay white and black will stay black as the lightness of the image is preserved
  func tint(tintColor: UIColor) -> UIImage {
    
    return modifiedImage { context, rect in
      // draw black background - workaround to preserve color of partially transparent pixels
      context.setBlendMode(.normal)
      UIColor.black.setFill()
      context.fill(rect)
      
      // draw original image
      context.setBlendMode(.normal)
      context.draw(self.cgImage!, in: rect)
      
      // tint image (loosing alpha) - the luminosity of the original image is preserved
      context.setBlendMode(.color)
      tintColor.setFill()
      context.fill(rect)
      
      // mask by alpha values of original image
      context.setBlendMode(.destinationIn)
      context.draw(self.cgImage!, in: rect)
    }
  }
  
  // fills the alpha channel of the source image with the given color
  // any color information except to the alpha channel will be ignored
  func fillAlpha(fillColor: UIColor) -> UIImage {
    
    return modifiedImage { context, rect in
      // draw tint color
      context.setBlendMode(.normal)
      fillColor.setFill()
      context.fill(rect)
      //            context.fillCGContextFillRect(context, rect)
      
      // mask by alpha values of original image
      context.setBlendMode(.destinationIn)
      context.draw(self.cgImage!, in: rect)
    }
  }
  
  private func modifiedImage( draw: (CGContext, CGRect) -> ()) -> UIImage {
    
    // using scale correctly preserves retina images
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    let context: CGContext! = UIGraphicsGetCurrentContext()
    assert(context != nil)
    
    // correctly rotate image
    context.translateBy(x: 0, y: size.height)
    context.scaleBy(x: 1.0, y: -1.0)
    
    let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
    
    draw(context, rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
  
}
