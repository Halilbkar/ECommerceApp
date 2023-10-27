//
//  +TextField.swift
//  FoodApp
//
//  Created by Halil Bakar on 26.10.2023.
//

import Foundation
import UIKit.UITextField

import UIKit

extension UITextField {
    func addLeftView(image: String, text: String, target: Any?, selector: Selector) {
        let leftViewWidth: CGFloat = 100
        let leftViewHeight: CGFloat = 50
        let leftView = UIView(frame: CGRect(x: 16, y: 0, width: leftViewWidth, height: leftViewHeight))
        leftView.backgroundColor = .systemGray6
        leftView.layer.cornerRadius = 24
        
        guard let image = UIImage(named: image) else {
            return
        }

        let imageViewWidth: CGFloat = 40
        let imageViewHeight: CGFloat = 20
        let imageView = UIImageView(frame: CGRect(x: 5, y: (leftViewHeight - imageViewHeight) / 2, width: imageViewWidth, height: imageViewHeight))
        imageView.image = image
        leftView.addSubview(imageView)

        let labelX: CGFloat = 50
        let labelWidth: CGFloat = leftViewWidth - labelX
        let label = UILabel(frame: CGRect(x: labelX, y: 0, width: labelWidth, height: leftViewHeight))
        label.text = text
        leftView.addSubview(label)

        self.leftView = leftView
        self.leftViewMode = .always
        
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        leftView.addGestureRecognizer(tapGesture)
    }
}

