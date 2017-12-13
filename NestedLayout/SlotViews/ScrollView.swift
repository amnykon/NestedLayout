import Foundation
import UIKit

public class ScrollView: SlotView {
  private let scrollView = UIScrollView()
  private var subview: UIView?
  private let scrollViewContents = UIView()

  override public init(subview: UIView) {
    self.subview = subview
    super.init(subview: subview)

    super.addSubview(scrollView)

    scrollView.translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
    rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true

    scrollView.addSubview(scrollViewContents)
    scrollViewContents.translatesAutoresizingMaskIntoConstraints = false
    scrollView.topAnchor.constraint(equalTo: scrollViewContents.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: scrollViewContents.bottomAnchor).isActive = true
    scrollView.leftAnchor.constraint(equalTo: scrollViewContents.leftAnchor).isActive = true
    scrollView.rightAnchor.constraint(equalTo: scrollViewContents.rightAnchor).isActive = true

    let heightConstraint = heightAnchor.constraint(equalTo: scrollViewContents.heightAnchor)
    heightConstraint.priority = UILayoutPriority(500)
    heightConstraint.isActive = true

    let widthConstraint =  widthAnchor.constraint(equalTo: scrollViewContents.widthAnchor)
    widthConstraint.priority = UILayoutPriority(500)
    widthConstraint.isActive = true
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func addSubview(_ view: UIView) {
    self.subview?.removeFromSuperview()
    subview = view

    scrollViewContents.addSubview(view)

    view.translatesAutoresizingMaskIntoConstraints = false
    scrollViewContents.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollViewContents.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollViewContents.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    scrollViewContents.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
  }
}
