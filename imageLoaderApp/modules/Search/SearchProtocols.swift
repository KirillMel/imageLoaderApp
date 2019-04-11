//
//  SearchProtocols.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol SearchViewProtocol: class {
    func displayAlert(title: String, message: String) -> Void
    func reloadData() -> Void
    func insertItem(position: IndexPath) -> Void
}

protocol SearchPresenterForViewProtocol {
    func getCountOfList() -> Int
    func getItem(by id: Int) -> (title: String, imageURL: String)
    func searchItem(with title: String?) -> Void
    func setUpModule() -> Void
}

protocol SearchPresenterForInteractorProtocol: class {
    func searchItemEnded(with error: String?) -> Void
    func loadDataDidSuccessful() -> Void
}

protocol SearchInteractorProtocol {
    func searchItem(with title: String) -> Void
    func getItem(by id: Int) -> GifItem
    func getCountOfList() -> Int
    func loadItems() -> Void
}

protocol SearchRouterProtocol: class {
    
}

protocol SearchConfiguratorProtocol: class {
    func configure(with view: SearchViewProtocol) -> Void
}
