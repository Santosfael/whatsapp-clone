//
//  ChatsViewModelTests.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 05/11/24.
//

import XCTest
@testable import whatsAppClone

final class ChatsViewModelTests: XCTestCase {
    private let serviceSpy = WhatsAppServiceSpy()
    private lazy var sut = ChatsViewModel(whatsAppService: serviceSpy)

    func testListChatCallWhatsAppServiceChat() {
        sut.listChat { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)

            }
        }
        XCTAssertTrue(serviceSpy.fetchChatsCalled)
    }

    func testListChatCallWhatsAppServiceChatOnce() {
        sut.listChat { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)

            }
        }

        XCTAssertEqual(serviceSpy.fetchChatsCallCount, 1)
    }

    func testListChatCallWhatsAppServiceChatIsNotNilShouldDoNoting() {
        serviceSpy.fetchChatsToBeReturned = [Talk.fixture(name: "Jhon")]

        sut.listChat { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)

            }
        }
        
        XCTAssertNotNil(serviceSpy.fetchChatsToBeReturned)
        XCTAssertEqual(serviceSpy.fetchChatsToBeReturned?[0].name, "Jhon")
    }

    func testListTalksByUnreadChat() {
        let result = sut.listUnreadChat(talks: [Talk.fixture(unread: true)], filter: "unread")

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, 1)
    }

    func testListTalksByAllChat() {
        let result = sut.listUnreadChat(talks: [Talk.fixture(unread: true)], filter: "all")

        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, 1)
    }

    func testListTalskByUnreadChatNil() {
        let result = sut.listUnreadChat(talks: [Talk.fixture(unread: false)], filter: "unread")

        XCTAssertEqual(result?.count, 0)
    }
}
