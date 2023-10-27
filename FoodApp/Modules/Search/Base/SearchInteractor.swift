//
//  SearchInteractor.swift
//  FoodApp
//
//  Created by Halil Bakar on 28.10.2023.
//

import Foundation

protocol SearchInteractorInputs {
    func fetchData()
    func showModel() -> [CountryModelElement]?
}

protocol SearchInteractorOutputs: AnyObject {
    
}

final class SearchInteractor {
    
    weak var presenter: SearchInteractorOutputs?
    
    private var countries: [CountryModelElement] = []
    
}

extension SearchInteractor: SearchInteractorInputs {
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "CountryJSON", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let countries = try JSONDecoder().decode([CountryModelElement].self, from: data)
            self.countries = countries
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func showModel() -> [CountryModelElement]? {
        return self.countries
    }
}
