//
//  UserDefaultsManager.swift
//  ToDo
//
//  Created by Полина Толстенкова on 20.09.2022.
//

import Foundation

class UDManager: DataManager {
    
    var tasks: [UDModel] = [UDModel]() {
        didSet {
            save()
        }
    }
    
    init() {
        updateTasks()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(tasks) {
            UserDefaults.standard.set(data, forKey: "Task")
        }
    }

    func addTask(_ title: String) {
        tasks.append(UDModel(title: title))
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func updateTasks() {
        if let data = UserDefaults.standard.data(forKey: "Task") {
            let decoder = JSONDecoder()
            
            if let savedData = try? decoder.decode([UDModel].self, from: data){
                tasks = savedData
            }
        }
    }
    
    func fetchTasks() -> [TaskModel] {
        return tasks
    }
}


