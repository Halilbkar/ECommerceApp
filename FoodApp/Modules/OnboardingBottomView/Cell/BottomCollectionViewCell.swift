//
//  BottomCollectionViewCell.swift
//  FoodApp
//
//  Created by Halil Bakar on 26.10.2023.
//

import UIKit

protocol BottomCollectionViewProtocol: AnyObject {
    func continueButtonTapped(title: String)
    func countryCodeTapped()
}

class BottomCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: CGFloat.dWidth(padding: 12))
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .blue
        config.baseForegroundColor = .white
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var countryTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Enter phone number"
        textField.borderStyle = .roundedRect
        textField.addLeftView(image: "foodLogo", text: "+90", target: self, selector: #selector(leftViewTapped))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var phoneCodeTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Enter code"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    
    
    weak var delegate: BottomCollectionViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(continueButton)
        addSubview(countryTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 48)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 20)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -20)),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 12)),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 20)),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -20)),
            
            countryTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 28)),
            countryTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            countryTextField.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 340)),
            countryTextField.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 64)),
            
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -20)),
            continueButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 52)),
            continueButton.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 335))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    @objc func continueButtonTapped() {
        if let title = continueButton.titleLabel?.text {
            delegate?.continueButtonTapped(title: title)
        }
    }
    
    @objc func leftViewTapped() {
        delegate?.countryCodeTapped()
    }
    
    internal func showModel(model: BottomCellModel?) {
        titleLabel.text = model?.title
        descriptionLabel.text = model?.description
        continueButton.setTitle(model?.buttonTitle, for: .normal)
    }
}

extension BottomCollectionViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = phoneCodeTextField.text, let textRange = Range(range, in: text) else { return false }
        let updatedText = text.replacingCharacters(in: textRange, with: string)
        return updatedText.count <= 4
    }
}
