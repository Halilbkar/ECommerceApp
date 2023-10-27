//
//  CountryModel.swift
//  FoodApp
//
//  Created by Halil Bakar on 27.10.2023.
//

import Foundation

struct CountryModelElement: Codable {
    let name: String
    let dialCode: String
    let code: String

    enum CodingKeys: String, CodingKey {
        case name
        case dialCode = "dial_code"
        case code
    }
}

typealias CountryModel = [CountryModelElement]
