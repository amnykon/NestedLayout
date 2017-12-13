import Foundation
import UIKit

extension UIControlEvents: Hashable {
  public var hashValue: Int {
    return Int(rawValue)
  }
}

fileprivate class EventHandler {
  let event: UIControlEvents
  weak var callbacks: Callbacks?

  init(event: UIControlEvents) {
    self.event = event
  }

  @objc func invoke() {
    callbacks?.invoke(for: event)
  }

  func add(to control: UIControl) {
    control.addTarget(self, action: #selector(invoke), for: event)
  }
}

fileprivate class Callbacks {
  let closures: [UIControlEvents:()->()]
  private let targets: [EventHandler]

  init (_ closures: [UIControlEvents:()->()]) {
    targets = closures.keys.map{EventHandler(event: $0)}
    self.closures = closures
    targets.forEach{$0.callbacks = self}
  }

  func invoke(for event:UIControlEvents) {
    closures[event]?()
  }

  func add(to control: UIControl) {
    targets.forEach{$0.add(to: control)}
  }
}

extension UIControl {
  public var callbacks: [UIControlEvents: ()->()] {
    get {
      return (objc_getAssociatedObject(self, "callbacks") as? Callbacks)?.closures ?? [:]
    }
    set {
      let callbacks = Callbacks(newValue)
      callbacks.add(to: self)
      objc_setAssociatedObject(self, "callbacks", callbacks, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
  }
}
