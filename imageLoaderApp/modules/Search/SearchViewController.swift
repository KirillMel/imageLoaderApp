//
//  SearchViewController.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchViewProtocol {
    //viper layers
    let configurator: SearchConfiguratorProtocol! = SearchConfigurator()
    var presenter: SearchPresenterForViewProtocol!
    //MARK: - Outlets
    var tableView: UITableView!
    var searchBar: UISearchBar!
    let cellId = "cellId"
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        configureView()
        
        presenter.setUpModule()
    }
    
    override func loadView() {
        let currentView = SearchSceneView()
        view = currentView
        
        tableView = currentView.tableView
        searchBar = currentView.headerView
    }
    //MARK: - SearchViewProtocol
    func displayAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func insertItem(position: IndexPath) {
        DispatchQueue.main.async {
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [position], with: .automatic)
            self.tableView.endUpdates()
        }
    }
    //MARK: - Helper methods
    private func configureView() {
        tableView.register(GifCell.self, forCellReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountOfList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! GifCell
        let item = presenter.getItem(by: indexPath.row)
        
        cell.setUp(with: item.title, item.imageData)
        
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchItem(with: searchBar.text)
        view.endEditing(true)
    }
}
