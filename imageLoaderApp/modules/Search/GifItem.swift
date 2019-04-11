//
//  GifItem.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import RealmSwift

class GifItem: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
}
