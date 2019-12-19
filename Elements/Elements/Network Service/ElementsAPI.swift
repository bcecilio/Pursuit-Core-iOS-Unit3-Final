//
//  ElementsAPI.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ElementsAPI {
    static func fetchElements(completion: @escaping (Result<[Elements], AppError>) ->()) {
        
        let elementEndpoingUrl = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: elementEndpoingUrl) else {
            completion(.failure(.badURL(elementEndpoingUrl)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let elementData = try JSONDecoder().decode([Elements].self, from: data)
                    let elements = elementData
                    completion(.success(elements))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
