//
//  RealmModel.swift
//  ToDo
//
//  Created by Полина Толстенкова on 20.09.2022.
//

import Foundation
import RealmSwift

class RealmModel: Object, TaskModel, Identifiable{
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var title: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}

