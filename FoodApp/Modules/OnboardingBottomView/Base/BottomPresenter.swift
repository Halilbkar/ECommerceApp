//
//  BottomPresenter.swift
//  FoodApp
//
//  Created by Halil Bakar on 26.10.2023.
//

import Foundation

protocol BottomPresenterInputs {
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAtIndexPath(indexPath: IndexPath) -> BottomCellModel?
    func cellButtonTapped(title: String)
    func cellCountryCodeTapped()
}

final class BottomPresenter {
    
    private weak var view: BottomViewProtocol?
    private let interactor: BottomInteractorInputs?
    private let router: BottomRouterProtocol?
    
    init(view: BottomViewProtocol, interactor: BottomInteractorInputs, router: BottomRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension BottomPresenter: BottomPresenterInputs {
    func viewDidLoad() {
        view?.viewConfigration()
        view?.bottomSizeConfigration()
        interactor?.createBottomItems(number: "1")
    }
    
    func numberOfItemsInSection() -> Int {
        return interactor?.showBottomItems()?.count ?? 0
    }
    
    func cellForItemAtIndexPath(indexPath: IndexPath) -> BottomCellModel? {
        return self.interactor?.showBottomItems()?[indexPath.item]
    }
    
    func cellButtonTapped(title: String) {
        if title.contains("Continue") {
            view?.scrollToNextItem()
        } else {
            router?.toBack()
        }
    }
    
    func cellCountryCodeTapped() {
        router?.toSearch()
    }
}

extension BottomPresenter: BottomInteractorOutputs {
    
}
