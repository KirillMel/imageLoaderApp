//
//  ParserProtocol.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

protocol ParserProtocol {
    associatedtype Result
    func parse(_ data: Data) -> Result
}
