//
//  HTTPMethod.swift
//  whatsAppClone
//
//  Created by Rafael on 31/10/24.
//

import Foundation

enum HTTPMethod: String {

    /// Defines the suported types of HTTP methods
    case post
    case put
    case get
    case delete
    case patch

    /// Returns the name of the method to be used in the request
    public var name: String {
        return rawValue.uppercased()
    }
}
