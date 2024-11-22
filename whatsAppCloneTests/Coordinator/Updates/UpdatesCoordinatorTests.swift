//
//  UpdatesCoordinatorTests.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 13/11/24.
//

import XCTest
@testable import whatsAppClone

final class UpdatesCoordinatorTests: XCTestCase {
    private let navigationController = UINavigationController()
    private lazy var sut = UpdatesCoordinator()

    func testTabBarStartNavigationCountViewControllers() {
        sut.navigationController = navigationController
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func testTabBarStartTopViewControllerUpdatesViewController() {
        sut.navigationController = navigationController
        sut.start()
        XCTAssertTrue(navigationController.topViewController is UpdatesViewController)
    }
}

