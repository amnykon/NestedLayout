import Foundation
import UIKit

public class VerticalStackView: BinView {
  var lastAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>?
  var lastConstraint: NSLayoutConstraint?

  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    if let lastConstraint = lastConstraint {
      removeConstraint(lastConstraint)
    }

    view.translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    (lastAnchor ?? topAnchor).constraint(equalTo: view.topAnchor).isActive = true
    lastConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor)

    lastConstraint?.isActive = true
    lastAnchor = view.bottomAnchor
  }
}
