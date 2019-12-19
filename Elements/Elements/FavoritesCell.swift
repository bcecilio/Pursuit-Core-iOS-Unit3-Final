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
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementNumber: UILabel!
    
    func configureElementCell(for elementData: Elements) {
        
        elementName.text = elementData.name
        elementNumber.text = elementData.number.description
        
//        elementImageView.getImage(with: <#T##String#>, completion: <#T##(Result<UIImage, AppError>) -> ()#>)
    }
}
