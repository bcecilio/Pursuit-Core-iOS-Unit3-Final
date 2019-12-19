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
        elementNumber.text = elementData.number.description
        
        elementImage.getElementImage(with: 10) { (result) in
            switch result {
            case .failure( _):
                DispatchQueue.main.async {
                    self.elementImageView.image = UIImage(systemName: "exclamationmark.fill")
                }
            case .success( _):
                DispatchQueue.main.async {
                    self.elementImageView.image = UIImage(contentsOfFile: elementData.id!)
                }
            }
        }
    }
}
