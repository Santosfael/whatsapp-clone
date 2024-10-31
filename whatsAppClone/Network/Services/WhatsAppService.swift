//
//  ApiWhatsApp.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import Foundation

class WhatsAppService: WhatsAppServiceProtocol {
    let session = URLSession.shared

    static let shared: WhatsAppService = {
        let instance = WhatsAppService()
        return instance
    }()

    // MARK: - Public Methods
    public func chat(handler: @escaping completion) {
        let request: Request = .chats

        if var baseURL = URLComponents(string: request.baseURL) {
            baseURL.path = request.path

            guard let url = baseURL.url else { return handler(.failure(.urlInvalid)) }
            var requestURL = URLRequest(url: url)
            requestURL.httpMethod = request.method.name

            let dataTask = session.dataTask(with: requestURL) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse else { return }

                if httpResponse.statusCode == 200 {
                    do {
                        guard let jsondata = data else { return handler(.failure(.noProcessData)) }
                        let decoder = JSONDecoder()
                        let responseData = try decoder.decode(ChatResponse.self, from: jsondata)
                        handler(.success(responseData.chats))
                    } catch let error {
                        handler(.failure(.error(error.localizedDescription)))
                    }
                } else if httpResponse.statusCode == 409 {
                    handler(.failure(.urlInvalid))
                }
            }
            dataTask.resume()
        }
    }
}

