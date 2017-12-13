import Foundation
import UIKit

extension UIView {
  public func fill(subview: UIView) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: subview.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: subview.centerYAnchor).isActive = true
    widthAnchor.constraint(equalTo: subview.widthAnchor).isActive = true
    heightAnchor.constraint(equalTo: subview.heightAnchor).isActive = true
  }
}
