import Foundation
import UIKit

public class VerticalCenterAlignmentView: SlotView {
  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor).isActive = true
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
  }
}
