//
//  UserDefaultsManager.swift
//  ToDo
//
//  Created by Полина Толстенкова on 15.09.2022.
//

import Foundation

class UDModel: Codable, TaskModel {
    
    var id = UUID()
    var title: String
    
    init(title: String) {
        self.title = title
        
    }
}
