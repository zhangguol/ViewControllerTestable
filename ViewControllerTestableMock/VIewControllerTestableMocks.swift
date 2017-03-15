//
//  VIewControllerTestableMocks.swift
//  ViewControllerTestable
//
//  Created by Boxuan Zhang on 3/14/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import Foundation
import ViewControllerTestable

public class MockViewControllerPresenter: ViewControllerPresentable {

    public init() {}
    
    public var present_wasCalled = false
    public var present_wasCalled_withArgs: (viewController: UIViewController, from: UIViewController, animated: Bool)?
    public var present_completion: (() -> Void)?

    public func present(_ viewController: UIViewController,
                        from aViewController: UIViewController,
                        animated: Bool,
                        completion: (() -> Void)?) {

        present_wasCalled = true
        present_wasCalled_withArgs = (viewController, aViewController, animated)
        present_completion = completion
    }
}

public class MoockViewControllerDismisser: ViewControllerDismissable {
    
    public init() {}

    public var dismiss_wasCalled = false
    public var dismiss_wasCalled_withArgs: (viewController: UIViewController, animated: Bool)?
    public var dismiss_completion: (() -> Void)?
    
    public func dismiss(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        dismiss_wasCalled = true
        dismiss_wasCalled_withArgs = (viewController, animated)
        dismiss_completion = completion
    }
}

public class MockViewControllerPusher: ViewControllerPushable {
    
    public init() {}

    public var push_wasCalled = false
    public var push_wasCalled_withArgs: (viewControlelr: UIViewController, in: UINavigationController, animated: Bool)?

    public func push(_ viewController: UIViewController, in navigationControler: UINavigationController, animated: Bool) {
        push_wasCalled = true
        push_wasCalled_withArgs = (viewController, navigationControler, animated)
    }
}
