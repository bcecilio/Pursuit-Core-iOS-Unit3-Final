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
    
    static func favoriteElement(elements: Elements, completion: @escaping (Result<Bool, AppError>) -> ()){
        
        let elementEndpointUrl = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: elementEndpointUrl) else {
            completion(.failure(.badURL(elementEndpointUrl)))
            return
        }
        
        do {
            let data = try JSONEncoder().encode(elements)
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            request.httpMethod = "POST"
            
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(.decodingError(error)))
        }
    }
    
    static func getFavoriteElements(completion: @escaping (Result<[Elements], AppError>) -> ()) {
        
        let endpointURL = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let favoriteElements = try JSONDecoder().decode([Elements].self, from: data)
                    completion(.success(favoriteElements))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
