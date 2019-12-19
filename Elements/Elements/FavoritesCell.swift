//
//  FavoritesCell.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var favoritesName: UILabel!
    @IBOutlet weak var favortiesNumber: UILabel!
    
    func configureFavoriteCell(for elementData: Elements) {
        
        favoritesName.text = elementData.name
        favortiesNumber.text = elementData.number.description
        
        favoritesImageView.getImage(with: elementData.id ?? "") { (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.favoritesImageView.image = UIImage(systemName: "exclamationmark.fill")
                }
            case .success( _):
                DispatchQueue.main.async {
                    self.favoritesImageView.image = UIImage(contentsOfFile: elementData.id!)
                }
            }
        }
    }
}
