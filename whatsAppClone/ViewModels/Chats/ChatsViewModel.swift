//
//  ChatsViewModel.swift
//  whatsAppClone
//
//  Created by Rafael on 31/10/24.
//

import Foundation

final class ChatsViewModel: ChatsViewModelProtocol {
    
    // MARK: - Public Properties
    var whatsAppService: WhatsAppServiceProtocol

    // MARK: - Initialized
    init(whatsAppService: WhatsAppServiceProtocol) {
        self.whatsAppService = whatsAppService
    }

    // MARK: - Public Methods
    public func listChat(handler: @escaping completion) {
        whatsAppService.chat(handler: handler)
    }

    public func listUnreadChat(talks: [Talk], filter: String) -> [Talk]? {
        var chats: [Talk] = []
        if filter == "unread" {
            let chatFilter = talks.filter { talk in
                talk.unread == true
            }
            chats = chatFilter
        } else if filter == "all" {
            chats = talks
        }
        return chats
    }
}
