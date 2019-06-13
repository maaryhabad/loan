import UIKit

extension UIViewController {
  /// A helper function to add child view controller.
  func add(childViewController: UIViewController) {
    childViewController.willMove(toParentViewController: self)
    addChildViewController(childViewController)
    view.addSubview(childViewController.view)
    childViewController.didMove(toParentViewController: self)
  }
}
