//
//  SearchRouter.swift
//  FoodApp
//
//  Created by Halil Bakar on 28.10.2023.
//

import Foundation
import UIKit.UIViewController

protocol SearchRouterProtocol {
    
}

final class SearchRouter {
    
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    static func startSearch() -> UIViewController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let router = SearchRouter(view: view)
        let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}

extension SearchRouter: SearchRouterProtocol {
    
}
