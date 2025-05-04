//
//  ProductsViewController.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import UIKit

final class ProductsViewController: UIViewController {

    private let api = FakeStoreAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Products"
        self.view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchProducts()
    }
}

private extension ProductsViewController {
    
    func fetchProducts() {
        api.getProducts { products, error in
            if let products {
                print("Products: \(products)")
            }
            if let error {
                print("JSON decoding error: \(error)")
            }
        }
    }
}
