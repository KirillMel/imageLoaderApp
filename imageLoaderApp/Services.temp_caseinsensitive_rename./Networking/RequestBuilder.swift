//
//  RequestBuilder.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class RequestBuilder {
    
    static let shared = RequestBuilder()
    
    private init() { }
    
    func getURLRequest(route: String, headers: [String: String]?, params: [String: Any]?) -> URLRequest {
        var url = URLComponents(string: route)!
        guard let params = params else { return URLRequest(url: url.url!)}
        
        url.queryItems = getQueryItems(params: params)
        var request = URLRequest(url: url.url!)
        
        guard let headers = headers else { return request}
        
        request.allHTTPHeaderFields = headers
        return request
    }
    
    private func getQueryItems(params: [String: Any]) -> [URLQueryItem]{
        var query = [URLQueryItem]()
        
        for key in params.keys {
            query.append(URLQueryItem(name: key, value: "\(params[key] ?? "")"))
        }
        
        return query
    }
}
