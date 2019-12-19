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
        favortiesNumber.text = "\(elementData.number.description) | \(elementData.atomicMass?.description ?? "")"
        
        var elementNum = String(elementData.number)
        
        if elementNum.count == 1 {
            elementNum = "00" + elementNum
        } else if elementNum.count == 0 {
            elementNum = "0" + elementNum
        }
        
        let imageUrl = "http://www.theodoregray.com/periodictable/Tiles/\(elementNum)/s7.JPG"
        
        favoritesImageView.getImage(with: imageUrl) { [weak self] (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async{
                    self?.favoritesImageView.image = UIImage(systemName: "exclamationmark.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                self?.favoritesImageView.image = image
                }
            }
        }
        }
    }
