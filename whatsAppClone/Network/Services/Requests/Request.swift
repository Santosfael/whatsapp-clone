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
        return "/v3/69935042-4818-4532-955f-972fea495576"
    }

    var query: String {
        ""
    }

    var method: HTTPMethod {
        return .get
    }
}
