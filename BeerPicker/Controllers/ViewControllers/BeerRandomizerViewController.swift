//
//  BeerRandomizerViewController.swift
//  BeerPicker
//
//  Created by Christopher Alegre on 10/2/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit
import ImageIO

class BeerRandomizerViewController: UIViewController {
    
    @IBOutlet weak var beerRoulette: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    func getBeer() {
//        BeerRandomizerController.fetchBeer { (beer) in
//            self.prepare(for: toBeer, sender: beerRoulette)
//        }
//    }
    
//    func setBeerGifImage() {
//        DispatchQueue.main.async {
//            let beerGif = UIImageView.gif
//            self.beerGifImage?.image = beerGif
//        }
//    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBeer" {
            guard segue.destination is BeerouletteViewController else {return}
            }
            
        }
        
    }


