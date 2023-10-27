//
//  SearchPresenter.swift
//  FoodApp
//
//  Created by Halil Bakar on 28.10.2023.
//

import Foundation

protocol SearchPresenterInputs {
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAtIndexPath(indexPath: IndexPath) -> CountryModelElement?
}

final class SearchPresenter {
    
    private weak var view: SearchViewProtocol?
    private let interactor: SearchInteractorInputs?
    private let router: SearchRouterProtocol?
    
    init(view: SearchViewProtocol, interactor: SearchInteractorInputs, router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchPresenter: SearchPresenterInputs {
    func viewDidLoad() {
        view?.addSubview()
        view?.navBarConfigration()
        interactor?.fetchData()
    }
    
    func numberOfItemsInSection() -> Int {
        return interactor?.showModel()?.count ?? 0
    }
    
    func cellForItemAtIndexPath(indexPath: IndexPath) -> CountryModelElement? {
        return self.interactor?.showModel()?[indexPath.row]
    }
}

extension SearchPresenter: SearchInteractorOutputs {
    
}
