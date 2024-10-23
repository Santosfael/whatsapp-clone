//
//  HomeViewControllerDelegate.swift
//  whatsAppClone
//
//  Created by Rafael on 22/10/24.
//

import Foundation

protocol ChatsViewControllerDelegate: AnyObject {
    func chatMessageUser(user: Talk)
}
