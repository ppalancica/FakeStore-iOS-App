//
//  RootViewController.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import UIKit

final class RootViewController: UIViewController {
    
    private var shouldShowProducts = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Root"
        self.view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        assert(navigationController != nil, "RootViewController must be embedded inside a UINavigationController")
        
        if shouldShowProducts {
            showProducts()
            shouldShowProducts = false
        }
    }
}

private extension RootViewController {
    func showProducts() {
        let productsVC = ProductsViewController()
        navigationController?.pushViewController(productsVC, animated: true)
    }
}
