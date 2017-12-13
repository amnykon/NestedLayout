import Foundation
import UIKit

public class DepthStackView: BinView {
  override public func addSubview(_ view: UIView) {
    super.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
  }
}
