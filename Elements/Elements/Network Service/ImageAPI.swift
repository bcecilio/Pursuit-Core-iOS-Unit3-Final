//
//  ImageAPI.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct elementImage {
    static func getElementImage(with elementNum: Int, completion: @escaping (Result<[Elements], AppError>) -> ()) {
        
        let urlImage = "http://www.theodoregray.com/periodictable/Tiles/\(elementNum)/s7.JPG"
        
        guard let image = URL(string: urlImage) else {
            completion(.failure(.badURL(urlImage)))
            return
        }
        
        let request = URLRequest(url: image)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let imageData = try JSONDecoder().decode([Elements].self, from: data)
                    completion(.success(imageData))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
