import Foundation
import UIKit

public class RotationCWView: SlotView {

  public override init(subview: UIView) {
    super.init(subview: subview)
    transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/2)
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
  }
}
