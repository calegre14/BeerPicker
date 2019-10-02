//
//  BeerouletteViewController.swift
//  BeerPicker
//
//  Created by Christopher Alegre on 10/2/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class BeerouletteViewController: UIViewController {
    
    var beer: Beer?
    
    @IBOutlet weak var beerLabel: UILabel!
    @IBOutlet weak var apvLabel: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        descriptionLabel.layer.borderWidth = 2
//        descriptionLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        updateView(beer: beer)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let buyer = ["1 to the right", "2 to the Right", "3 to the right", "You're Buying", "1 to the Left", "2 to the Left", "3 to the Left"]
        let buyingAlert = UIAlertController(title: "Who's Buying?", message: "\(buyer.randomElement()!)", preferredStyle: .alert)
        let toTheBeer = UIAlertAction(title: "Random Beer", style: .default) { (_) in }
        buyingAlert.addAction(toTheBeer)
        self.present(buyingAlert, animated: true)
    }
    
    func updateView(beer: Beer?) {
        BeerRandomizerController.fetchBeer { (beer) in
            DispatchQueue.main.async {
                guard let beer = beer else {return}
                self.beerLabel.text = beer.dataDictionary.name
                self.apvLabel.text = "\(beer.dataDictionary.abv ?? "")%"
                self.dateCreated.text = beer.dataDictionary.createDate
                self.categoryLabel.text = beer.dataDictionary.style.category.name
                self.styleLabel.text = beer.dataDictionary.style.name
                self.descriptionLabel.text = beer.dataDictionary.style.description
            }
        }
    }
}
