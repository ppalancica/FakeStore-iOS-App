

//
//  FakeStoreAPI.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import Foundation

struct Product {
    let name: String
    let price: Float
}

enum FakeStoreAPIError: Error {
    case networkError
    case serverError
}

final class FakeStoreAPI {
    
    private let baseUrlString = "https://fakestoreapi.com"
    
    //
    // https://fakestoreapi.com/products
    //
    func getProducts(completion: @escaping ([Product]?, FakeStoreAPIError?) -> Void) {
        let productsUrlString = baseUrlString + "/" + "products"
        let productsUrl = URL(string: productsUrlString)!
        let urlRequest = URLRequest(url: productsUrl)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error != nil else {
                completion(nil, .networkError)
                return
            }
            
            guard let _ = data, let _ = response else {
                completion(nil, .serverError)
                return
            }
            
            // Process Data and Response...
            
            let products: [Product] = [
                .init(name: "Shoes", price: 180),
                .init(name: "T-shirt", price: 25),
                .init(name: "Jeans", price: 100)
            ]
            
            completion(products, nil)
        }
        
        task.resume()
    }
}
