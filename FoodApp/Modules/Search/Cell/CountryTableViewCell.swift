//
//  CountryTableViewCell.swift
//  FoodApp
//
//  Created by Halil Bakar on 28.10.2023.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: CGFloat.dWidth(padding: 16))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var countryCodeLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 16))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(countryLabel)
        addSubview(countryCodeLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            countryCodeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 20)),
            countryCodeLabel.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 50)),
        
            countryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: countryCodeLabel.trailingAnchor, constant: CGFloat.dWidth(padding: 5))
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func showModel(model: CountryModelElement?) {
        countryCodeLabel.text = model?.dialCode
        countryLabel.text = model?.name
    }
}
