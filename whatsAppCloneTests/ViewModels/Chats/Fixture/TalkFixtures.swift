//
//  TalkFixtures.swift
//  whatsAppCloneTests
//
//  Created by Rafael on 05/11/24.
//

import Foundation
@testable import whatsAppClone

extension Talk {
    static func fixture(
        id: Int = 0,
        name: String = "",
        picture: String = "",
        latest_timestamp: String = "",
        lastChat: String = "",
        unread: Bool = true) -> Self {
            .init(
             id: id,
             name: name,
             picture: picture,
             latest_timestamp: latest_timestamp,
             lastChat: lastChat,
             unread: unread
        )
    }
}
