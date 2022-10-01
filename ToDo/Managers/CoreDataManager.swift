//
//  CoreDataManager.swift
//  ToDo
//
//  Created by Полина Толстенкова on 13.09.2022.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataManager: DataManager {
    
    var tasks: [TaskModel] = []
    
    //MARK: - Persistence
    
    let container = NSPersistentContainer(name: "CoreDataModel")
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    init() {
        self.container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent container: \(error.localizedDescription)")
            }
        }
    }


    func save() {
        do{
            try context.save()
        } catch {
            context.rollback()
            print("Failed to save task with CoreData: \(error.localizedDescription)")
        }
    }

    func update() -> [TaskModel] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()

        do {
           return try context.fetch(request)
        } catch {
            print("Failed to fetch request with CoreData: \(error.localizedDescription)")
            return []
        }
    }


    //MARK: - DataManager Methods
    
    func addTask(_ title: String) {
        let task = Task(context: context)
        task.title = title
        task.id = UUID()
        
        save()
    }
    
    func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
           let task = tasks[index]
            context.delete(task as! NSManagedObject)
        }
        save()
    }
    
    func updateTasks() {
        tasks = update()
    }
    
    func fetchTasks() -> [TaskModel] {
        return tasks
    }
        
}

