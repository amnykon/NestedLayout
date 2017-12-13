import Foundation
import UIKit

public class FixedSizeView: SlotView {

  public init(width: CGFloat? = nil, height: CGFloat? = nil, subview: UIView) {
    super.init(subview: subview)
    if let width = width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    if let height = height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
  }
}
