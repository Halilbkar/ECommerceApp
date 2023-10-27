//
//  +CGFloat.swift
//  FoodApp
//
//  Created by Halil Bakar on 25.10.2023.
//

import Foundation
import UIKit

extension CGFloat {
    
    static func dWidth(padding: CGFloat) -> Self {
        let padding = UIScreen.main.bounds.width*(padding/375)
        return padding
    }
    
    static func dHeight(padding: CGFloat) -> Self {
        let padding = UIScreen.main.bounds.height*(padding/812)
        return padding
    }
}
