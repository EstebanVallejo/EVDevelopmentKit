import Foundation

public func delay(seconds: Double, closure: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
}
