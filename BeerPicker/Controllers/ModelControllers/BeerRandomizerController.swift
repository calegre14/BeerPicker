//
//  BeerRandomizerController.swift
//  BeerPicker
//
//  Created by Christopher Alegre on 10/2/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class BeerRandomizerController {
    
    private static let baseURL = URL(string: "https://sandbox-api.brewerydb.com/")
    
    static func fetchBeer(completion: @escaping (Beer?) -> Void) {
        guard var url = self.baseURL else {fatalError("URL Optional is nil")}
        url.appendPathComponent("v2")
        url.appendPathComponent("beer")
        url.appendPathComponent("random")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let apiKeyQuery = URLQueryItem(name: "key", value: "0f89d23595bff26a68bb444fda9b734e")
        urlComponents?.queryItems = [apiKeyQuery]
        
        guard let finalURL = urlComponents?.url else {completion(nil); return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            if let data = data {
                do {
                    let beer = try JSONDecoder().decode(Beer.self, from: data)
                    completion(beer)
                } catch {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        } .resume()
    }
}
