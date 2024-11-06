//
//  WhatsAppServiceSpy.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 05/11/24.
//

@testable import whatsAppClone

final class WhatsAppServiceSpy: WhatsAppServiceProtocol {
    private(set) var fetchChatsCalled: Bool = false
    var fetchChatsCallCount: Int = 0
    var fetchChatsToBeReturned: [Talk]?
    func chat(handler: @escaping completion) {
        fetchChatsCalled = true
        fetchChatsCallCount += 1
        if let fetchChatsToBeReturned = fetchChatsToBeReturned {
            handler(.success(fetchChatsToBeReturned))
        }
    }
}
