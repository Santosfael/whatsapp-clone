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
        return "/v3/584d7967-557f-4b08-a4c6-782a9a00fe35"
    }

    var query: String {
        ""
    }

    var method: HTTPMethod {
        return .get
    }
}
