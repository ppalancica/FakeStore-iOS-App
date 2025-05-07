//
//  FakeStoreAPIError.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import Foundation

extension FakeStoreAPI {
    enum FakeStoreAPIError: Error {
        case invalidUrl
        case networkIssue
        case invalidResponse
        case invalidData
        case jsonDecoding
    }
}
