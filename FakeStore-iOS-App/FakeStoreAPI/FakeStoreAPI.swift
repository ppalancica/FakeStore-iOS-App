

//
//  FakeStoreAPI.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import Foundation

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
            // Check if there is no error
            guard error == nil else {
                completion(nil, .invalidRequest)
                return
            }
            
            // Check if Response and Data are valid
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, .invalidResponse)
                return
            }
            guard let data else {
                completion(nil, .invalidData)
                return
            }

            // Decode Data containing JSON representation of Products
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(products, nil)
            } catch {
                completion(nil, .jsonDecoding)
            }
        }
        
        task.resume()
    }
}
