//
//  DataLoader.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class DataLoader {
    func getLoadData(with route: String, complete: @escaping CompletionHandler) {
        let request = RequestBuilder.shared.getURLRequest(route: route, headers: nil, params: nil)
        
        UrlSessionWrapper.shared.getRequest(request: request, complete: complete)
    }
}
