//
//  SearchConfigurator.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class SearchConfigurator: SearchConfiguratorProtocol {
    func configure(with view: SearchViewProtocol) {
        let viewController = view as! SearchViewController
        
        let presenter = SearchPresenter(viewController: viewController)
        let interactor = SearchInteractor(presenter: presenter)
        let router = SearchRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
    }
}
