//
//  ChatsViewModelProtocol.swift
//  whatsAppClone
//
//  Created by Rafael on 31/10/24.
//

import Foundation

protocol ChatsViewModelProtocol: AnyObject {
    var whatsAppService: WhatsAppServiceProtocol { get set }
    func listChat(handler: @escaping completion)
    func listUnreadChat(talks: [Talk], filter: String) -> [Talk]?
}
