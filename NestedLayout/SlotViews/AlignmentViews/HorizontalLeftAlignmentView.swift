import Foundation
import UIKit

public class HorizontalLeftAlignmentView: SlotView {
  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    widthAnchor.constraint(greaterThanOrEqualTo: view.widthAnchor).isActive = true
  }
}
