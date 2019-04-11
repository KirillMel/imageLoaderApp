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
        self.addSubview(tableView)
        
        tableView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        
        tableView.tableHeaderView?.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        headerView = UISearchBar()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView = UITableView()
        tableView.rowHeight = 180
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.tableHeaderView = headerView
    }
}
