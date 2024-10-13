//
//  Talk.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import Foundation

struct ChatResponse: Codable {
    let chats: [Talk]
}

struct Talk: Codable {
    let id: Int
    var name: String
    var picture: String
    let latest_timestamp: String
    let lastChat: String
}
