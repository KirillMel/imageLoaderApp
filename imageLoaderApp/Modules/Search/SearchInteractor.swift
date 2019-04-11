//
//  SearchInteractor.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorProtocol {
    //viper layer
    weak var presenter: SearchPresenterForInteractorProtocol!
    //MARK: - Services
    private let dataManager = DataManager<GifItem>()
    private let serverService = ServerService()
    private let dataLoader = DataLoader()
    //MARK: - Enteties
    private var items: [GifItem]
    
    required init(presenter: SearchPresenterForInteractorProtocol) {
        self.presenter = presenter
        self.items = [GifItem]()
    }
    //MARK: - SearchInteractorProtocol
    func searchItem(with title: String) {
        serverService.getUrl(with: title){ [weak self] result in
            guard let result = result as? String else {
                self?.presenter.searchItemEnded(with: "Error while searching gif")
                return
            }
            
            self?.dataLoader.getLoadData(with: result) { [weak self] data in
                let newItem = GifItem()
                newItem.title = title
                newItem.gifData = data as! Data
                
                self?.items.append(newItem)
                self?.presenter.searchItemEnded(with: nil)
                
                self?.saveItem(newItem)
            }
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
    //MARK: - helper methods
    private func saveItem(_ item: GifItem) {
        DispatchQueue.main.async {
            self.dataManager.saveData(item)
        }
    }
}
