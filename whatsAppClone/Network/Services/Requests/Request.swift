//
//  Request.swift
//  whatsAppClone
//
//  Created by Rafael on 31/10/24.
//

import Foundation

enum Request: URLRequestProtocol {
    case chats

    var baseURL: String {
        return Environment.baseURL
    }

    var path: String {
        return "/v3/d5023289-30f0-4785-86c8-4496b1500dae"
    }

    var query: String {
        ""
    }

    var method: HTTPMethod {
        return .get
    }
}
