//
//  Product.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import Foundation

extension FakeStoreAPI {
    struct Product: Decodable {
        let id: Int
        let title: String
        let price: Float
        let description: String
        let image: String
    }
}
