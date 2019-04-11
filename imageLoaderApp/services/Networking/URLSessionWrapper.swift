//
//  URLSessionWrapper.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class UrlSessionWrapper {
    static let shared = UrlSessionWrapper()
    private init() { }
    
    func getRequest(request: URLRequest, complete: @escaping CompletionHandler) -> Void {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                complete(nil)
                return
            }
            complete(data)
        }
        task.resume()
    }
}
