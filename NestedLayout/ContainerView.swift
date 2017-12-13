import Foundation
import UIKit

public class ContainerView: UIView {
  override public func willRemoveSubview(_ subview: UIView) {
    if subviews.count == 1 {
      removeFromSuperview()
    }
  }

  override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    for subview in subviews {
      if subview.point(inside: convert(point, to: subview), with: event) {
        return true
      }
    }
    return false
  }
}
