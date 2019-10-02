//
//  BeerRandomizer.swift
//  BeerPicker
//
//  Created by Christopher Alegre on 10/2/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

struct Beer: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case dataDictionary = "data"
    }
    
    let dataDictionary: DataDictionary
}

struct DataDictionary: Codable {
    let name: String
    let abv: String?
    let createDate: String
    let style: StyleDictionary
}

struct StyleDictionary: Codable {
    let name: String
    let description: String
    let category: CategoryDictionary
}

struct CategoryDictionary: Codable {
    let name: String
}
