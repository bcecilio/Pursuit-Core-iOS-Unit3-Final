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
    
    func configureElementCell(for elementData: Elements) {
        
        favoritesName.text = elementData.name
        favortiesNumber.text = elementData.number.description
        
//        elementImageView.getImage(with: <#T##String#>, completion: <#T##(Result<UIImage, AppError>) -> ()#>)
    }
}
