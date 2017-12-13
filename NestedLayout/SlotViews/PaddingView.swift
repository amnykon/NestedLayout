import Foundation
import UIKit

public class PaddingView: SlotView {
  public var leftPadding: CGFloat
  public var rightPadding: CGFloat
  public var topPadding: CGFloat
  public var bottomPadding: CGFloat

  public init(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat, subview: UIView) {
    leftPadding = left
    rightPadding = right
    topPadding = top
    bottomPadding = bottom
    super.init(subview: subview)
  }

  convenience public init(x: CGFloat, y: CGFloat, subview: UIView) {
    self.init(left: x, right: x, top: y, bottom: y, subview: subview)
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func addSubview(_ view: UIView) {
    super.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    leftAnchor.constraint(equalTo: view.leftAnchor, constant: -leftPadding).isActive = true
    rightAnchor.constraint(equalTo: view.rightAnchor, constant: rightPadding).isActive = true
    topAnchor.constraint(equalTo: view.topAnchor, constant: -topPadding).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomPadding).isActive = true
  }
}
