//
//  TaskViewModel.swift
//  ToDo
//
//  Created by Полина Толстенкова on 20.09.2022.
//

import Foundation
 
class TaskVM: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    @Published var dataManager: DataManager
    
    init(dataManager: DataManager = CoreDataManager()) {
        self.dataManager = dataManager
        update()
    }
    
    func save(_ title: String) {
        dataManager.addTask(title)
    }
    
    func delete(at offsets: IndexSet) {
        dataManager.deleteTask(at: offsets)
        tasks = dataManager.fetchTasks()
    }
    
    func update() {
        dataManager.updateTasks()
        tasks = dataManager.fetchTasks()
    }
    
    func switchDataManager(to database: Database) {
        switch database {
        case .realm:
            dataManager = RealmManager()
        case .coreData:
            dataManager = CoreDataManager()
        case .userDefaults:
            dataManager = UDManager()
        }
        update()
    }
}

enum Database {
    case realm
    case coreData
    case userDefaults
}
