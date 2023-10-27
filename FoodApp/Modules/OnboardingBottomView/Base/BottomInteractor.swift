//
//  BottomInteractor.swift
//  FoodApp
//
//  Created by Halil Bakar on 26.10.2023.
//

import Foundation

protocol BottomInteractorInputs {
    func createBottomItems(number: String)
    func showBottomItems() -> [BottomCellModel]?
}

protocol BottomInteractorOutputs: AnyObject {
    
}

final class BottomInteractor {
    
    weak var presenter: BottomInteractorOutputs?
    
    private var bottomItems: [BottomCellModel] = []
}

extension BottomInteractor: BottomInteractorInputs {
    func createBottomItems(number: String) {
        bottomItems =
        [
            .init(title: "Input Phone Number",
                  description: "You will receive a 6 digit for phone verification number",
                  buttonTitle: "Continue"),
            
            .init(title: "Confirmation",
                  description: "Input a 4 digit code we’ve just sent to \(number)",
                  buttonTitle: "Continue"),
            
            .init(title: "Personal Information",
                  description: "We use this information to facilitate transactions on this application",
                  buttonTitle: "Register")
        ]
    }
    
    func showBottomItems() -> [BottomCellModel]? {
        return self.bottomItems
    }
    
//    func fetchData() {
//        guard let url = Bundle.main.url(forResource: "CountryJSON", withExtension: "json") else { return }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let countries = try JSONDecoder().decode(CountryModel.self, from: data)
//            for country in countries {
//                print("Name: \(country.name)")
//                // Diğer özellikler için print fonksiyonunu kullanabilirsiniz
//                print("----------------------")
//            }
//        } catch {
//            print("Hata: \(error)")
//        }
//    }
}
