//
//  ServerService.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

typealias CompletionHandler = (Any?) -> Void

class ServerService {
    let route = "https://api.giphy.com/v1/gifs/search"
    private let headers = ["api_key": "RY6GAeT02Rj9lXbqb0Rny9rE9rHYkH0E"]
    private let parser = FieldParser()

    func getUrl(with title: String, complete: @escaping CompletionHandler) {
        let params = ["q": title, "limit": "1"]
        let request = RequestBuilder.shared.getURLRequest(route: route, headers: headers, params: params)
        
        UrlSessionWrapper.shared.getRequest(request: request) { data in
            guard let data = data else {
                complete(nil)
                return
            }
            let url = self.parser.parse(data as! Data)
            complete(url)
        }
    }
}
