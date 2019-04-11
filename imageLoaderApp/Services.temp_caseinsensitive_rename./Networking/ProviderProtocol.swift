//
//  Provider.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol ProviderProtocol {
    func request<T>(parseService: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ())
}
