import Foundation
import UIKit

public class BinView: ContainerView {
  public init(subviews: [UIView]) {
    super.init(frame: CGRect())

    for subview in subviews {
      addSubview(subview)
    }
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
