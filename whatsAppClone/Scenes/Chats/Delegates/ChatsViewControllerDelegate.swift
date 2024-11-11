//
//  HomeViewControllerDelegate.swift
//  whatsAppClone
//
//  Created by Rafael on 22/10/24.
//

import Foundation

protocol ChatsViewControllerDelegate: AnyObject {
    func chatMessageUser(user: Talk)
    func listChats(completion: @escaping completion)
    func listUnreadTalk(talks: [Talk], filter: String) -> [Talk]?
    func getNumberUnreadTalk(numberUnread: Int)
}
