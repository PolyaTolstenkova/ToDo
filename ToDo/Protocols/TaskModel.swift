//
//  TaskModel.swift
//  ToDo
//
//  Created by Полина Толстенкова on 11.09.2022.
//

import Foundation
import RealmSwift

protocol TaskModel {
    var id: UUID { get set }
    var title: String { get set }
}

