//
//  SearchPresenter.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterForViewProtocol, SearchPresenterForInteractorProtocol {
    
    weak var viewController: SearchViewProtocol!
    var interactor: SearchInteractorProtocol!
    var router: SearchRouterProtocol!
    
    required init(viewController: SearchViewProtocol) {
        self.viewController = viewController
    }
    
    func getCountOfList() -> Int {
        return interactor.getCountOfList()
    }
    
    func getItem(by id: Int) -> (title: String, imageURL: String) {
        let item = interactor.getItem(by: id)
        return (item.title, item.url)
    }
    
    func searchItem(with title: String?) {
        interactor.searchItem(with: title!)
    }
    
    func searchItemEnded(with error: String?) {
        if (error == nil) {
            let position = IndexPath(row: interactor.getCountOfList() - 1, section: 0)
            viewController.insertItem(position: position)
        }
    }
    
    func loadDataDidSuccessful() {
        viewController.reloadData()
    }
    
    func setUpModule() {
        interactor.loadItems()
    }
    
}
