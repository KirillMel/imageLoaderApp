//
//  SearchPresenter.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterForViewProtocol, SearchPresenterForInteractorProtocol {
    //viper layers
    weak var viewController: SearchViewProtocol!
    var interactor: SearchInteractorProtocol!
    var router: SearchRouterProtocol!
    
    required init(viewController: SearchViewProtocol) {
        self.viewController = viewController
    }
    //MARK: - SearchPresenterForViewProtocol
    func setUpModule() {
        interactor.loadItems()
    }
    
    func getCountOfList() -> Int {
        return interactor.getCountOfList()
    }
    
    func getItem(by id: Int) -> (title: String, imageData: Data) {
        let item = interactor.getItem(by: id)
        return (item.title, item.gifData)
    }
    
    func searchItem(with title: String?) {
        guard let title = title, !title.isEmpty else {
            viewController.displayAlert(title: "Notice.", message: "You must enter correct string")
            return
        }
        interactor.searchItem(with: title)
    }
    //MARK: - SearchPresenterForInteractorProtocol
    func searchItemEnded(with error: String?) {
        if let error = error {
            viewController.displayAlert(title: "Notice.", message: error)
        } else {
            let count = interactor.getCountOfList() - 1
            let position = IndexPath(row: count, section: 0)
            viewController.insertItem(position: position)
        }
    }
    
    func loadDataDidSuccessful() {
        viewController.reloadData()
    }
}
