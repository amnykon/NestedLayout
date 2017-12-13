import Foundation
import UIKit

public class HorizontalStackView: BinView {
  var lastAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>?
  var lastConstraint: NSLayoutConstraint?

  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    if let lastConstraint = lastConstraint {
      removeConstraint(lastConstraint)
    }

    view.translatesAutoresizingMaskIntoConstraints = false
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    (lastAnchor ?? leftAnchor).constraint(equalTo: view.leftAnchor).isActive = true
    lastConstraint = rightAnchor.constraint(equalTo: view.rightAnchor)

    lastConstraint?.isActive = true
    lastAnchor = view.rightAnchor
  }
}
