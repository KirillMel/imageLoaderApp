//
//  SearchScene.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class SearchSceneView: UIView {
    
    var tableView: UITableView!
    var headerView: UISearchBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpViews()
        self.setConstraints()
        
        tableView.tableHeaderView?.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        headerView = UISearchBar()
        headerView.searchBarStyle = .minimal
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView = UITableView()
        tableView.rowHeight = 180
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        self.addSubview(headerView)
        self.backgroundColor = .white
    }
    
    private func setConstraints() {
        if #available(iOS 11, *) {
            let guide = self.safeAreaLayoutGuide
            NSLayoutConstraint.activate([headerView.heightAnchor.constraint(equalToConstant: 55),
                                         headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor),
                                         headerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
                                         headerView.topAnchor.constraint(equalTo: guide.topAnchor),
                                         tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                                         tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                         tableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
                                         tableView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 1.0, constant: -55)])
        }
    }
}
