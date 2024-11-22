//
//  CommunitiesCoordinatorTests.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 13/11/24.
//

import XCTest
@testable import whatsAppClone

final class CommunitiesCoordinatorTests: XCTestCase {
    private let navigationController = UINavigationController()
    private lazy var sut = CommunitiesCoordinator()

    func testTabBarStartNavigation() {
        sut.navigationController = navigationController
        sut.start()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is CommunitiesViewController)
    }
}
