//
//  ViewControllerTestableTests.swift
//  ViewControllerTestableTests
//
//  Created by Boxuan Zhang on 3/14/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import XCTest
@testable import ViewControllerTestable

class ViewControllerTestableTests: XCTestCase {

    var vc: TestableViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = TestableViewController()
    }

    func testDefaultViewControllerPresenter() {
        vc.viewControllerPresenter.present(UIViewController(), from: vc, animated: true, completion: nil)
        XCTAssert(vc.present_wasCalled == true)
    }

    func testDefaultViewControlelrDismisser() {
        vc.viewControllerDismisser.dismiss(vc, animated: true, completion: nil)
        XCTAssert(vc.dismiss_wasCalled == true)
    }

    func testDefaultViewControllerPusher() {
        let naviVC = TestableNavigationController(rootViewController: vc)
        vc.viewControllerPusher.push(UIViewController(), in: naviVC, animated: true)
        XCTAssert(naviVC.push_wasCalled == true)
    }

    func testSettingViewControlelrPresenter() {
        vc.viewControllerPresenter = Presenter()
        XCTAssert(vc.viewControllerPresenter is Presenter)
    }

    func testSettingViewControllerDismisser() {
        vc.viewControllerDismisser = Dismisser()
        XCTAssert(vc.viewControllerDismisser is Dismisser)
    }

    func testSettingViewControllerPusher() {
        vc.viewControllerPusher = Pusher()
        XCTAssert(vc.viewControllerPusher is Pusher)
    }
}

extension ViewControllerTestableTests {
    class TestableViewController: UIViewController, ViewControllerTestable {

        var present_wasCalled = false
        override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
            present_wasCalled = true
        }

        var dismiss_wasCalled = false
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            dismiss_wasCalled = true
        }
    }

    class TestableNavigationController: UINavigationController {
        var push_wasCalled = false
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            push_wasCalled = true
        }
    }

    class Presenter: ViewControllerPresentable {
        func present(_ viewController: UIViewController,
                     from aViewController: UIViewController,
                     animated: Bool,
                     completion: (() -> Void)?) {
        }
    }

    class Dismisser: ViewControllerDismissable {
        func dismiss(_ viewController: UIViewController,
                     animated: Bool,
                     completion: (() -> Void)?) {
        }
    }

    class Pusher: ViewControllerPushable {
        func push(_ viewController: UIViewController,
                  in navigationControler: UINavigationController,
                  animated: Bool) {
        }
    }
}
