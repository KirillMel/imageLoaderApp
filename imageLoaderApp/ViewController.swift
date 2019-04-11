//
//  ViewController.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import UIKit

class ViewControllerTest: UIViewController {

    var arr = [("first",""), ("first",""), ("first","")]
    var tableView: UITableView!
    var search: UISearchBar!
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(GifCell.self, forCellReuseIdentifier: cellId)
        addDoneButtonOnKeyboard()
    }
    
    override func loadView() {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        let headerView = UISearchBar()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        table.tableHeaderView = headerView
        view = table
        
        table.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        table.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        table.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        table.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0).isActive = true
        
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headerView.widthAnchor.constraint(equalTo: table.widthAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: table.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: table.topAnchor).isActive = true
        
        table.tableHeaderView?.layoutIfNeeded()
        
        tableView = table
        search = headerView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        search.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        search.resignFirstResponder()
//        UrlSessionWrapper.shared.getRequest(param: title!){ result in
//            self.arr.append(("cat", result ?? ""))
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
}

extension ViewControllerTest: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! GifCell
        var item = arr[indexPath.row]
        if (item.1 == "") { item.1 = "Image" }
        cell.setUp(with: item.0, item.1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

class UrlSessionWrapper1 {
    static let shared = UrlSessionWrapper1()
    
    let parser: FieldParser!
    
    private let paramsForRequest = ["X-Auth-Token":"20af8e9e0aa0472d9ed60092262e5d12"]
    private let headers = [
        "api_key": "RY6GAeT02Rj9lXbqb0Rny9rE9rHYkH0E",
    ]
    private init() {
        parser = FieldParser()
    }
    
    func getRequest(urlString: String = "https://api.giphy.com/v1/gifs/search", param: String ,success: @escaping (String?) -> Void) -> Void {
        var url = URLComponents(string: urlString)
        // var request =  try? URLRequest(url: url!, method: .get , headers: headers)
        var queryItem = [URLQueryItem]()
        queryItem.append(URLQueryItem(name: "q", value: param))
        queryItem.append(URLQueryItem(name: "limit", value: "1"))
        url?.queryItems = queryItem
        var request = URLRequest(url: url!.url!)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                success("")
                return
            }
            print(type(of: data))
            let result = self.parser.parse(data)
            success(result)
        }
        task.resume()
    }
    
    func performRequest() -> Void {
        
    }
}

