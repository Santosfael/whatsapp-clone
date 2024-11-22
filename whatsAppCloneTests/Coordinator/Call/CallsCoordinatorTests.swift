//
//  CallsCoordinatorTests.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 13/11/24.
//

import XCTest
@testable import whatsAppClone

final class CallsCoordinatorTests: XCTestCase {
    private let navigationController = UINavigationController()
    private lazy var sut = CallsCoordinator()

    func testTabBarStartNavigation() {
        sut.navigationController = navigationController
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is CallViewController)
    }
}
