//
//  FieldParser.swift
//  imageLoaderApp
//
//  Created by kirill on 4/11/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation

class FieldParser: ParserProtocol {
    func parse(_ data: Data) -> String? {
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
        let arrayResults = ((jsonObject as? NSDictionary)?["data"] as? NSArray)
        
        guard arrayResults!.count > 0 else { return nil }
        let resultDictionary = ((arrayResults![0] as! NSDictionary)["images"] as! NSDictionary)["preview_gif"] as! NSDictionary
        
        return resultDictionary["url"] as? String
    }
}
