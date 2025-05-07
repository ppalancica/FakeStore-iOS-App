//
//  ProductsViewController.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import UIKit

final class ProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let api = FakeStoreAPI()
    
    private var products: [FakeStoreAPI.Product] = []
    
    private let cellIdentifier = String(describing: ProductTableViewCell.self)
    
    private let productsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Products"
        productsTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        productsTableView.dataSource = self
        productsTableView.delegate = self
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchProducts()
    }
    
    func setupUI() {
        view.addSubview(productsTableView)
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource Methods

extension ProductsViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.configureWithProduct(product)
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension ProductsViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // ...
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Private Methods

private extension ProductsViewController {
    
    func fetchProducts() {
        api.getProducts { products, error in
            if let products {
                dump(products)
                DispatchQueue.main.async {
                    self.products = products
                    self.productsTableView.reloadData()
                }
            }
            if let error {
                print("JSON decoding error: \(error)")
            }
        }
    }
}
