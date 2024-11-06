//
//  whatsAppServiceProtocol.swift
//  whatsAppClone
//
//  Created by Rafael on 31/10/24.
//

import Foundation

enum WhatsAppError: Error, Equatable {
    case error(String)
    case urlInvalid
    case noDataAvaliable
    case noProcessData
}

typealias completion = (Result<[Talk], WhatsAppError>) -> Void

protocol WhatsAppServiceProtocol: AnyObject {
    func chat(handler: @escaping completion)
}
