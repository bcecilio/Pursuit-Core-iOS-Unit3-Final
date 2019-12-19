//
//  ElementsCell.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementsCell: UITableViewCell {

    @IBOutlet weak var elementImageView: UIImageView!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementNumber: UILabel!

    
    func configureElementCell(for elementData: Elements) {
        
        elementName.text = elementData.name
        elementNumber.text = "\(elementData.number.description) | \(elementData.atomicMass ?? 0)"
       
        var elementNum = String(elementData.number)
        
        if elementNum.count == 1 {
            elementNum = "00" + elementNum
        } else if elementNum.count == 0 {
            elementNum = "0" + elementNum
        }
        
        let imageUrl = "http://www.theodoregray.com/periodictable/Tiles/\(elementNum)/s7.JPG"
        
        elementImageView.getImage(with: imageUrl) { [weak self] (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async{
                    self?.elementImageView.image = UIImage(systemName: "exclamationmark.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                self?.elementImageView.image = image
                }
            }
        }
    }
}
