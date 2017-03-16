//
//  ViewControllerTetsableMockTests.swift
//  ViewControllerTestable
//
//  Created by Boxuan Zhang on 3/16/17.
//  Copyright © 2017 Boxuan Zhang. All rights reserved.
//

import XCTest
@testable import ViewControllerTestable

class ViewControllerTetsableMockTests: XCTestCase {
    var vc1: UIViewController!
    var vc2:  UIViewController!
    var naviVC: UINavigationController!

    override func setUp() {
        super.setUp()

        vc1 = UIViewController()
        vc2 = UIViewController()
        naviVC = UINavigationController(rootViewController: UIViewController())
    }

    func testMockViewControllerPresenter() {
        let mockPresenter = MockViewControllerPresenter()
        mockPresenter.present(vc1, from: vc2, animated: true, completion: nil)
        XCTAssert(mockPresenter.present_wasCalled == true)
        XCTAssert(mockPresenter.present_wasCalled_withArgs?.viewController === vc1)
        XCTAssert(mockPresenter.present_wasCalled_withArgs?.from === vc2)
        XCTAssert(mockPresenter.present_wasCalled_withArgs?.animated == true)
    }

    func testMockViewControllerDismisser() {
        let mockDismisser = MoockViewControllerDismisser()
        mockDismisser.dismiss(vc1, animated: true, completion: nil)
        XCTAssert(mockDismisser.dismiss_wasCalled == true)
        XCTAssert(mockDismisser.dismiss_wasCalled_withArgs?.viewController === vc1)
        XCTAssert(mockDismisser.dismiss_wasCalled_withArgs?.animated == true)
    }

    func testMockViewControllerPusher() {
        let mockPusher = MockViewControllerPusher()
        mockPusher.push(vc1, in: naviVC, animated: true)
        XCTAssert(mockPusher.push_wasCalled == true)
        XCTAssert(mockPusher.push_wasCalled_withArgs?.viewControlelr === vc1)
        XCTAssert(mockPusher.push_wasCalled_withArgs?.in === naviVC)
        XCTAssert(mockPusher.push_wasCalled_withArgs?.animated == true)
    }
}
