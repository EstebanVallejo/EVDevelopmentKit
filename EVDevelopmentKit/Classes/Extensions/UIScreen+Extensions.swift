//
//  UIScreen+Extensions.swift
//  Wuzhear
//
//  Created by Steve on 3/9/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import UIKit

extension UIScreen {
  public var width: CGFloat {
    return size.width
  }
  
  public var height: CGFloat {
    return size.height
  }
  
  public var size: CGSize {
    return bounds.size
  }
}
