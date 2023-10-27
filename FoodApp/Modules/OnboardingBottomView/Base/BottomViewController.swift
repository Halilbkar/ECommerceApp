//
//  BottomViewController.swift
//  FoodApp
//
//  Created by Halil Bakar on 26.10.2023.
//

import UIKit

protocol BottomViewProtocol: AnyObject {
    func viewConfigration()
    func bottomSizeConfigration()
    func scrollToNextItem()
}

class BottomViewController: UIViewController {
    
    private lazy var bottomCollectionView: UICollectionView = {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BottomCollectionViewCell.self, forCellWithReuseIdentifier: BottomCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.layer.cornerRadius = CGFloat.dWidth(padding: 32)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    var presenter: BottomPresenterInputs!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        NSLayoutConstraint.activate([
        
            bottomCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            bottomCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BottomViewController: BottomViewProtocol {
    func viewConfigration() {
        view.addSubview(bottomCollectionView)
    }
    
    func bottomSizeConfigration() {
        self.isModalInPresentation = true
        
        if let sheet =  self.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.4 * context.maximumDetentValue
            })]
        }
    }
    
    func scrollToNextItem() {
        let currentIndexPath = bottomCollectionView.indexPathsForVisibleItems.first
        
        if let currentIndexPath {
            let nextIndexPath = IndexPath(row: currentIndexPath.row + 1, section: currentIndexPath.section)
            bottomCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension BottomViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomCollectionViewCell.identifier, for: indexPath) as? BottomCollectionViewCell else { return UICollectionViewCell() }
        
        cell.showModel(model: presenter.cellForItemAtIndexPath(indexPath: indexPath))
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}

extension BottomViewController: BottomCollectionViewProtocol {
    func continueButtonTapped(title: String) {
        presenter.cellButtonTapped(title: title)
    }
    
    func countryCodeTapped() {
        presenter.cellCountryCodeTapped()
        print("test")
    }
}
