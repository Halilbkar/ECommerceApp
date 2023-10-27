//
//  OnboardingPresenter.swift
//  FoodApp
//
//  Created by Halil Bakar on 25.10.2023.
//

import Foundation

protocol OnboardingPresenterInputs {
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAtIndexPath(indexPath: IndexPath) -> OnboardCellModel?
    func cellNextStartButtonTapped(title: String)
}

final class OnboardingPresenter {
    
    private weak var view: OnboardingViewProtocol?
    private let interactor: OnboardingInteractorInputs?
    private let router: OnboardingRouterProtocol?
    
    init(view: OnboardingViewProtocol, interactor: OnboardingInteractorInputs, router: OnboardingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension OnboardingPresenter: OnboardingPresenterInputs {
    func viewDidLoad() {
        view?.setupConstraints()
        interactor?.createOnboardingItems()
    }
    
    func numberOfItemsInSection() -> Int {
        self.interactor?.showOnboardingItems()?.count ?? 0
    }
    
    func cellForItemAtIndexPath(indexPath: IndexPath) -> OnboardCellModel? {
        return self.interactor?.showOnboardingItems()?[indexPath.item]
    }
    
    func cellNextStartButtonTapped(title: String) {
        if title.contains("Next") {
            view?.scrollToNextItem()
        } else {
            router?.toBottom()
        }
    }
}

extension OnboardingPresenter: OnboardingInteractorOutputs {
    
}
