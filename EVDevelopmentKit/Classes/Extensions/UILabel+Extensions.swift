//
//  UILabel+Extensions.swift
//  Wuzhear
//
//  Created by Steve on 3/9/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

public extension UILabel {
  
  public func isTruncated() -> Bool {
    
    if let string = self.text {
      
      let size: CGSize = (string as NSString).boundingRect(
        with: CGSize(width: self.frame.size.width, height: .greatestFiniteMagnitude),
        options: NSStringDrawingOptions.usesLineFragmentOrigin,
        attributes: [NSFontAttributeName: self.font],
        context: nil).size
      
      if (size.height > self.bounds.size.height) {
        return true
      }
    }
    
    return false
  }
  
}

