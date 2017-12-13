import Foundation
import UIKit

open class Button: UIButton {
  public init(
    title:String? = nil,
    image:UIImage? = nil,
    isImageOnRight: Bool = false,
    touchUpInsideCallback: @escaping () -> ()
  ) {
    super.init(frame: CGRect())

    if let title = title {
      setTitle(title, for: .normal)
    }

    if let image = image {
      setImage(image, for: .normal)
    }

    if isImageOnRight {
      transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
      titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
      imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }

    callbacks = [.touchUpInside: touchUpInsideCallback]
  }

  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
