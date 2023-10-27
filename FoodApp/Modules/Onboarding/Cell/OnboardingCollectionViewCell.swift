//
//  OnboardingCollectionViewCell.swift
//  FoodApp
//
//  Created by Halil Bakar on 25.10.2023.
//

import UIKit

protocol OnboardCellButtonDelegate: AnyObject {
    func nextStartButtonTapped(title: String)
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "foodLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 28))
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 16))
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextStartButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .black
        config.baseForegroundColor = .white
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    weak var delegate: OnboardCellButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundImage)
        addSubview(logoImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(nextStartButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 360)),
            logoImage.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 120)),
            logoImage.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 120)),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: CGFloat.dHeight(padding: 72)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 24)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -24)),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 24)),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -24)),
            
            nextStartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -200)),
            nextStartButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextStartButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40)),
            nextStartButton.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 120))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        if let title = nextStartButton.titleLabel?.text {
            delegate?.nextStartButtonTapped(title: title)
        }
    }
    
    internal func showModel(model: OnboardCellModel?) {
        backgroundImage.image = model?.image
        titleLabel.text = model?.title
        descriptionLabel.text = model?.description
        nextStartButton.setTitle(model?.buttonTitle, for: .normal)
    }
}
