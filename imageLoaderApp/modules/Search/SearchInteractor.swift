//
//  SearchInteractor.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorProtocol {
    
    weak var presenter: SearchPresenterForInteractorProtocol!
    
    private var items: [GifItem]
    private let dataManager = DataManager<GifItem>()
    private var serverService = ServerService()
    
    required init(presenter: SearchPresenterForInteractorProtocol) {
        self.presenter = presenter
        self.items = [GifItem]()
    }
    
    func searchItem(with title: String) {
        serverService.perfomRequest(with: title){ [weak self] result in
            guard let result = result as? String else {
                self?.presenter.searchItemEnded(with: "Error while searching gif")
                return
            }
            let newItem = GifItem()
            newItem.title = title
            newItem.url = result
            
            self?.items.append(newItem)
            
            self?.presenter.searchItemEnded(with: nil)
            self?.dataManager.saveData(item: newItem)
        }
    }
    
    func getItem(by id: Int) -> GifItem {
        return items[id]
    }
    
    func getCountOfList() -> Int {
        return items.count
    }
    
    func loadItems() {
        items = dataManager.loadData()
        presenter.loadDataDidSuccessful()
    }
}
