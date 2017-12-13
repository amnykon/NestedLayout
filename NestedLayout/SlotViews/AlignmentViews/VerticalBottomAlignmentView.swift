import Foundation
import UIKit

public class VerticalBottomAlignmentView: SlotView {
  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor).isActive = true
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
  }
}
