import Foundation
import UIKit

public class SafeAreaView: SlotView {
  override public init(subview: UIView) {
    super.init(subview: subview)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)

    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func animateKeyboardLayoutChanges(_ sender: Notification) {
    guard
      let userInfo = sender.userInfo,
      let curveRawValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int,
      let animationCurve = UIViewAnimationCurve(rawValue: curveRawValue),
      let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double
    else {
      NSLog("unable to read userInfo")
      return
    }

    let curve: UIViewAnimationOptions
    switch animationCurve {
    case .easeIn:
      curve = .curveEaseIn
    case .easeInOut:
      curve = []
    case .easeOut:
      curve = .curveEaseOut
    case .linear:
      curve = .curveLinear
    }

    UIView.animate(withDuration: duration,
      delay: 0,
      options: [curve],
      animations: {
        [weak self] in
        self?.superview?.layoutIfNeeded()
      }
    )
    layoutIfNeeded()
  }

  private var keyboardConstraint: NSLayoutConstraint?

  @objc func keyboardWillHide(_ sender: Notification) {
    keyboardConstraint?.isActive = false
    keyboardConstraint = nil

    animateKeyboardLayoutChanges(sender)
  }

  @objc func keyboardWillShow(_ sender: Notification) {
    guard
      let userInfo = sender.userInfo,
      let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
    else {
      NSLog("unable to read userInfo")
      return
    }

    keyboardConstraint = superview?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frameValue.cgRectValue.height)
    keyboardConstraint?.priority = UILayoutPriority(975)
    keyboardConstraint?.isActive = true

    animateKeyboardLayoutChanges(sender)
  }

  override public func didMoveToSuperview() {
    super.didMoveToSuperview()
    var rootView: UIView = self
    while true {
      guard let parentView = rootView.superview else {
        break
      }
      rootView = parentView
    }

    translatesAutoresizingMaskIntoConstraints = false
    let safeAreaLayoutGuide: UILayoutGuide
    if #available(iOS 11.0, *) {
      safeAreaLayoutGuide = rootView.safeAreaLayoutGuide
    } else {
      safeAreaLayoutGuide = rootView.layoutGuides[0]
    }

    topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    let bottomConstraint = bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    bottomConstraint.priority = UILayoutPriority(950)
    bottomConstraint.isActive = true
    leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
    rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
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
