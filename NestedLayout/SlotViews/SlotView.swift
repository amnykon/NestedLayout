import Foundation
import UIKit

public class SlotView: ContainerView {
  public init(subview: UIView) {
    super.init(frame: CGRect())

    addSubview(subview)
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func addSubview(_ view: UIView) {
    for subview in subviews {
      subview.removeFromSuperview()
    }
    super.addSubview(view)
  }
}
