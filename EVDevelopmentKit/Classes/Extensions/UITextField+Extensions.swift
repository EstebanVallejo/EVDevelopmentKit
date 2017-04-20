import UIKit
import ObjectiveC

public extension UITextField {
  
  @IBInspectable public var placeHolderColor: UIColor? {
    get { return self.placeHolderColor }
    set {
      self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
    }
  }
  
}

fileprivate var previousTextFieldAssociationKey: UInt8 = 0
fileprivate var nextTextFieldAssociationKey: UInt8 = 1
fileprivate var toolbarAssociationKey: UInt8 = 2

//MARK: Properties
public extension UITextField {
  public var previousTextField : UITextField? {
    get {
      return objc_getAssociatedObject(self, &previousTextFieldAssociationKey) as? UITextField
    }
    
    set(newValue) {
      objc_setAssociatedObject(self, &previousTextFieldAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  public var nextTextField : UITextField? {
    get {
      return objc_getAssociatedObject(self, &nextTextFieldAssociationKey) as? UITextField
    }
    
    set(newValue) {
      objc_setAssociatedObject(self, &nextTextFieldAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  fileprivate var toolbar : UIToolbar? {
    get {
      var _toolbar = objc_getAssociatedObject(self, &toolbarAssociationKey) as? UIToolbar
      if _toolbar == nil { _toolbar = createToolbar() }
      return _toolbar
    }
    
    set(newValue) {
      objc_setAssociatedObject(self, &toolbarAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
}

//MARK: Public methods
public extension UITextField {
  public func set(previousTextField: UITextField?, nextTextField: UITextField?) {
    self.previousTextField = previousTextField
    self.nextTextField = nextTextField
  }
  
  public func addNavigationButtons() {
    var mutItems = [UIBarButtonItem]()
    
    let leftSpacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let rightSpacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    rightSpacing.width = 10
    let interSpacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    interSpacing.width = 10
    
    mutItems.append(leftSpacing)
    
    if previousTextField != nil {
      let prevButton = UIBarButtonItem(title: "<--".localized(), style: .plain, target: previousTextField, action: #selector(becomeFirstResponder))
      mutItems.append(prevButton)
      mutItems.append(interSpacing)
    }
    
    if nextTextField != nil {
      let nextButton = UIBarButtonItem( title: "-->".localized(), style: .plain, target: nextTextField, action: #selector(becomeFirstResponder))
      mutItems.append(nextButton)
      mutItems.append(interSpacing)
    }
    
    let okButton = UIBarButtonItem(title: "Ok".localized(), style: .plain, target: self, action: #selector(resignFirstResponder))
    mutItems.append(okButton)
    mutItems.append(rightSpacing)
    
    toolbar?.items = mutItems
    toolbar?.sizeToFit()
    
    inputAccessoryView = toolbar
  }
  
  public static func chain(textFields: [UITextField]?) {
    guard let textFields = textFields, textFields.isEmpty == false else { return }
    
    if textFields.count == 1 {
      
      textFields.first!.addNavigationButtons()
      
    } else {
      
      for (index, textField) in textFields.enumerated() {
        if textField == textFields.first {
          textField.nextTextField = textFields[index+1]
          
        } else if textField == textFields.last {
          textField.previousTextField = textFields[index-1]
          
        } else {
          textField.set(previousTextField: textFields[index-1], nextTextField: textFields[index+1])
        }
        
        textField.addNavigationButtons()
      }
      
    }
    
  }
}

//MARK: Private methods
extension UITextField {
  fileprivate func createToolbar() -> UIToolbar! {
    toolbar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.size
      .width, height: 44)))
    toolbar!.isTranslucent = true
    
    switch keyboardAppearance {
    case .dark: toolbar!.barStyle = .black
    default: toolbar!.barStyle = .default
    }
    
    return toolbar
  }
}
