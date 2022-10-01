//
//  RealmManager.swift
//  ToDo
//
//  Created by Полина Толстенкова on 20.09.2022.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmManager: DataManager {
    
    var tasks = [RealmModel]()

    var realm: Realm?
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            realm = try Realm()
        } catch {
            print("Error opening Realm \(error)")
        }
    }
    
    init() {
        openRealm()
        updateTasks()
    }

    
    func addTask(_ title: String) {
        if let realm = realm {
            do {
                try realm.write {
                    let newTask = RealmModel()
                    newTask.title = title
                    realm.add(newTask)
                    updateTasks()
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        if let realm = realm {
            do {
                try offsets.forEach { index in
                    try realm.write {
                        realm.delete(tasks[index])
                    }
                }
            } catch {
                print("Error deleting task with Realm: \(error)")
            }
        }
    }
    
    func updateTasks() {
        if let realm = realm {
            let allTasks = realm.objects(RealmModel.self)
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func fetchTasks() -> [TaskModel] {
        return tasks
    }
}


