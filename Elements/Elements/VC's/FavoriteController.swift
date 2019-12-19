//
//  FavoriteController.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteElements = [Elements]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func loadFavorites() {
        ElementsAPI.getFavoriteElements { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "AppError", message: "\(appError)")
                }
            case .success(let favorites):
                self?.favoriteElements = favorites
            }
        }
    }
}

extension FavoriteController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoritesCell else {
            fatalError("could not dequeue from favorite cell")
        }
        let favoriteCell = favoriteElements[indexPath.row]
        cell.configureFavoriteCell(for: favoriteCell)
        return cell
    }
    
    
}
