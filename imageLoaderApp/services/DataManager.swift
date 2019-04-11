//
//  DataManager.swift
//  imageLoaderApp
//
//  Created by kirill on 4/10/19.
//  Copyright © 2019 kirill. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

final class DataManager<T> where T:Object {
    func saveData(_ item: T) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
    }
    
    func loadData() -> [T] {
        let realm = try! Realm()
        return Array(realm.objects(T.self))
    }
}
