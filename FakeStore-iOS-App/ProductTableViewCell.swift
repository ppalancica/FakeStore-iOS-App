//
//  ProductTableViewCell.swift
//  FakeStore-iOS-App
//
//  Created by Pavel Palancica  on 04.05.2025.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let labelsContainerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 1
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func configureWithProduct(_ product: FakeStoreAPI.Product) {
        idLabel.text = "Product id: \(product.id)"
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price)"
    }

    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(labelsContainerStack)
        
        labelsContainerStack.addArrangedSubview(idLabel)
        labelsContainerStack.addArrangedSubview(titleLabel)
        labelsContainerStack.addArrangedSubview(descriptionLabel)
        labelsContainerStack.addArrangedSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 60),
            productImageView.heightAnchor.constraint(equalToConstant: 60),

            labelsContainerStack.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),
            labelsContainerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            labelsContainerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelsContainerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
