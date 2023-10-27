//
//  BottomRouter.swift
//  FoodApp
//
//  Created by Halil Bakar on 26.10.2023.
//

import Foundation
import UIKit.UIViewController

protocol BottomRouterProtocol {
    func toBack()
    func toSearch()
}

final class BottomRouter {
    
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    static func startBottomView() -> UIViewController {
        let view = BottomViewController()
        let interactor = BottomInteractor()
        let router = BottomRouter(view: view)
        let presenter = BottomPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
}

extension BottomRouter: BottomRouterProtocol {
    func toBack() {
        view?.dismiss(animated: true)
    }
    
    func toSearch() {
        let searchVC = SearchRouter.startSearch()
        
        searchVC.isModalInPresentation = false
        
        if let sheet =  searchVC.sheetPresentationController {
            sheet.detents = [.large()]
        }
        
        view?.present(searchVC, animated: true)
    }
}
