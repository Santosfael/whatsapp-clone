//
//  ApiWhatsApp.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import Foundation

// MARK: Enuns
enum ChatError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvariable
}

typealias completion = (Result<[Talk], ChatError>) -> Void

// MARK: - Protocols
protocol ServiceProtocol {
    func getChat(completion: @escaping completion)
}

// MARK: - Classes
class Service: ServiceProtocol {
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/d5023289-30f0-4785-86c8-4496b1500dae"

    // MARK: Static Method
    static let shared: Service = {
        let instance = Service()
        return instance
    }()

    // MARK: - Public Methods
    public func getChat(completion: @escaping completion) {
        guard let url = URL(string: url) else { return completion(.failure(.urlInvalid))}

        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else {
                    return completion(.failure(.noDataAvariable))
                }
                let decoder = JSONDecoder()
                let response = try decoder.decode(ChatResponse.self, from: jsonData)
                completion(.success(response.chats))
            } catch {
                completion(.failure(.noProcessData))
            }
        }

        dataTask.resume()
    }
}
