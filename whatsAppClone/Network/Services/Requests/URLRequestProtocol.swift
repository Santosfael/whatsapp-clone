//
//  URLRequestProtocol.swift
//  whatsAppClone
//
//  Created by Rafael on 31/10/24.
//

import Foundation

protocol URLRequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var query: String { get }
    var method: HTTPMethod { get }
}
