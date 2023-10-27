//
//  SearchViewController.swift
//  FoodApp
//
//  Created by Halil Bakar on 28.10.2023.
//

import UIKit

protocol SearchViewProtocol: AnyObject {
    func addSubview()
    func navBarConfigration()
}

final class SearchViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Enter phone number"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }()
    
    private lazy var countryTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.identifier)
        return tableView
    }()
    
    var presenter: SearchPresenterInputs!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 4)),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 48)),
            searchBar.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 335)),
            
            countryTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            countryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchViewController: SearchViewProtocol {
    func addSubview() {
        view.addSubview(searchBar)
        view.addSubview(countryTableView)
        view.backgroundColor = .white
    }
    
    func navBarConfigration() {
        self.navigationItem.title = "Search Country"
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItemsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier, for: indexPath) as! CountryTableViewCell
        
        cell.showModel(model: presenter.cellForItemAtIndexPath(indexPath: indexPath))
        return cell
    }
}
