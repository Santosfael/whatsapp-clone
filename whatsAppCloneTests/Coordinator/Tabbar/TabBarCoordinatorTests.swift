//
//  TabBarCoordinatorTests.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 13/11/24.
//

import XCTest
@testable import whatsAppClone

final class TabBarCoordinatorTests: XCTestCase {
    private let navigationController = UINavigationController()
    private lazy var sut = TabBarCoordinator(navigationController: navigationController)

    func testTabBarStartNavigation() {
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is TabBarController)
    }
}
