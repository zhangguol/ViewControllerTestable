# ViewControllerTestable

## What is it?
ViewControllerTestable is an extension to make a `UIViewController` testable with `present`, `dismiss`, and `push`

## Requirements
- iOS 10.0+
- Swift 3

## Usage

### Make a `UIViewController` testable

You need to `import UIViewControllerTestable` at first.

To make a `UIViewController` testable, just make it implement `UIViewControllerTestable` protocol

```
extension DemoUIViewController: UIViewControllerTestable {}
```

Then use

```
func present(_ viewController: UIViewController,
             from aViewController: UIViewController,
             animated: Bool,
             completion: (() -> Void)?)
```
to present a view controller. Or use

```
func dismiss(_ viewController: UIViewController,
             animated: Bool,
             completion: (() -> Void)?)

```
to dismiss a view controller. Also can use

```
func push(_ viewController: UIViewController,
          in navigationControler: UINavigationController,
          animated: Bool)
```
to push a view controller into a `UINavigationController`

### How to test a view controller

In the test case class, `import ViewControllerTestableMock` at first. Then set the view controller's `viewControllerPresent` to an instance of `MockViewControllerPresenter`

```
let mockPresenter = MockViewControllerPresenter()
viewController.viewControllerPresenter = mockPresenter
```

