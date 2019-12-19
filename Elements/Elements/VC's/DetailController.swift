//
//  DetailController.swift
//  Elements
//
//  Created by Brendon Cecilio on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var elementNumber: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var bolingPoint: UILabel!
    @IBOutlet weak var meltingPoint: UILabel!
    @IBOutlet weak var discoveredBy: UILabel!
    
    var elementDetail: Elements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.title = String(describing: elementDetail?.name)
    }
    
    @IBAction func favoriteButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let favoriteElement = elementDetail else {
            return
        }
        let favorites = Elements(name: favoriteElement.name, number: favoriteElement.number, symbol: favoriteElement.symbol, discoveredBy: favoriteElement.discoveredBy, melt: favoriteElement.melt, boil: favoriteElement.boil, id: favoriteElement.id, favoritedBy: "Brendon", image: favoriteElement.image, atomicMass: favoriteElement.atomicMass)
        
        ElementsAPI.favoriteElement(elements: favorites) { (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success:
                DispatchQueue.main.async {
                    self.showAlert(title: "Success", message: "\(favoriteElement.name) was added to Likes!")
                }
            }
        }
    }
    
    
    func updateUI() {
        guard let favorites = elementDetail else {
            print("could not load favorites")
            return
        }
        elementNumber.text = favorites.number.description
        elementName.text = "Element Name: \(favorites.name)"
        bolingPoint.text = "Boiling Point: \(favorites.boil?.description ?? "NA")"
        meltingPoint.text = "Melting Point: \(favorites.melt?.description ?? "NA")"
        discoveredBy.text = "Discovered by: \(favorites.discoveredBy ?? "NA")"
    }
}
